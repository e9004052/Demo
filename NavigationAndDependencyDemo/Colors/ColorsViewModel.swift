//
//  ColorsViewModel.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import Combine
import SwiftUI

final class ColorsState: ObservableObject {
    @Published fileprivate(set) var colors: [UUID: Color] = [:]
}

protocol ColorsOutput {
    var colorCountPublisher: AnyPublisher<Int, Never> { get }
}

final class ColorsViewModel: ColorsOutput {

    var colorCountPublisher: AnyPublisher<Int, Never> { state.$colors.map(\.count).eraseToAnyPublisher() }

    private var entrySubscriptions: [UUID: AnyCancellable] = [:]
    private var displaySubscription: AnyCancellable?

    private let state: ColorsState
    private let router: ColorsRouter

    private let colorGenerator: ColorGenerator

    init(state: ColorsState, router: ColorsRouter, colorGenerator: ColorGenerator) {
        self.state = state
        self.router = router
        self.colorGenerator = colorGenerator
    }

    func colorsDidSelectAdd() {
        attachColorEntry(forColor: nil, id: nil)
    }

    func colorsDidSelectDisplay(forId id: UUID) {
        guard let color = state.colors[id] else { return }
        let output = router.attachColorDisplay(color)
        displaySubscription = output.newColorPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] color in
                guard let self else { return }
                detachColorEntry(forId: id)
                attachColorEntry(forColor: color, id: id)
            }
    }

    func colorsDidToggleDummy() {
        if router.hasDummy {
            router.detachDummy()
        } else {
            _ = router.attachDummy()
        }
    }

    func colorsDidSelectBack() {
        router.goBack()
    }

    private func attachColorEntry(forColor color: Color?, id: UUID?) {
        let color = color ?? colorGenerator.makeColor()
        let id = id ?? UUID()
        let output = router.attachColorEntry(color, forId: id)
        state.colors[id] = color

        let subscription = output.removePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.detachColorEntry(forId: id)
            }
        entrySubscriptions[id] = subscription
    }

    private func detachColorEntry(forId id: UUID) {
        router.detachColorEntry(withId: id)
        entrySubscriptions.removeValue(forKey: id)
        state.colors.removeValue(forKey: id)
    }
}
