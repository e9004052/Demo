//
//  ColorEntryBuilder.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

final class ColorEntryBuilder {
    private let dependency: ColorEntryDependency
    private let parentRouter: ColorEntryParentRouter

    init(dependency: ColorEntryDependency, parentRouter: ColorEntryParentRouter) {
        self.dependency = dependency
        self.parentRouter = parentRouter
    }

    func build(forColor color: Color) -> ColorEntryResult {
        let viewState = ColorEntryViewState()
        let router = AppColorEntryRouter(parent: parentRouter, viewState: viewState)

        let state = ColorEntryState()
        let viewModel = ColorEntryViewModel(state: state, router: router)

        let view = ColorEntryView(viewModel: viewModel, state: state, viewState: viewState, color: color)

        return ColorEntryResult(view: view, output: viewModel)
    }
}
