//
//  ColorDisplayBuilder.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

final class ColorDisplayBuilder {
    private let dependency: ColorDisplayDependency
    private let parentRouter: ColorDisplayParentRouter

    init(dependency: ColorDisplayDependency, parentRouter: ColorDisplayParentRouter) {
        self.dependency = dependency
        self.parentRouter = parentRouter
    }

    func build(forColor color: Color) -> ColorDisplayResult {
        let viewState = ColorDisplayViewState()
        let router = AppColorDisplayRouter(parent: parentRouter, viewState: viewState)

        let state = ColorDisplayState(color: color)
        let viewModel = ColorDisplayViewModel(state: state, router: router, colorGenerator: dependency.colorGenerator)

        let view = ColorDisplayView(viewModel: viewModel, state: state, viewState: viewState)

        return ColorDisplayResult(view: view, output: viewModel)
    }
}
