//
//  ColorDisplayViewModel.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import Combine
import SwiftUI

final class ColorDisplayState: ObservableObject {
    @Published fileprivate(set) var color: Color

    init(color: Color) {
        self.color = color
    }
}

protocol ColorDisplayOutput {
    var newColorPublisher: AnyPublisher<Color, Never> { get }
}

final class ColorDisplayViewModel: ColorDisplayOutput {
    var newColorPublisher: AnyPublisher<Color, Never> {
        state.$color.dropFirst().eraseToAnyPublisher()
    }

    private let state: ColorDisplayState
    private let router: ColorDisplayRouter
    private let colorGenerator: ColorGenerator

    init(state: ColorDisplayState, router: ColorDisplayRouter, colorGenerator: ColorGenerator) {
        self.state = state
        self.router = router
        self.colorGenerator = colorGenerator
    }

    func colorDisplayDidSelectBack() {
        router.goBack()
    }

    func colorDisplayDidSelectUpdateColor() {
        let newColor = colorGenerator.makeColor()
        state.color = newColor
    }
}
