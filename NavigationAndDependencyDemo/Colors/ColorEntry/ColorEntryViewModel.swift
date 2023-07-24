//
//  ColorEntryViewModel.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import Combine
import SwiftUI

final class ColorEntryState: ObservableObject {}

protocol ColorEntryOutput {
    var removePublisher: AnyPublisher<Void, Never> { get }
}

final class ColorEntryViewModel: ColorEntryOutput {
    var removePublisher: AnyPublisher<Void, Never> {
        removeSubject.eraseToAnyPublisher()
    }

    private let removeSubject = PassthroughSubject<Void, Never>()

    private let state: ColorEntryState
    private let router: ColorEntryRouter

    init(state: ColorEntryState, router: ColorEntryRouter) {
        self.state = state
        self.router = router
    }

    func colorEntryDidSelectRemove() {
        removeSubject.send()
    }
}
