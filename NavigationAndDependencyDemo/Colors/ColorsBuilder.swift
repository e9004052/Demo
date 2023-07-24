//
//  ColorsBuilder.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

final class ColorsBuilder {
    private let dependency: ColorsDependency
    private let parentRouter: ColorsParentRouter

    init(dependency: ColorsDependency, parentRouter: ColorsParentRouter) {
        self.dependency = dependency
        self.parentRouter = parentRouter
    }

    func build() -> ColorsResult {
        let viewState = ColorsViewState()
        let router = AppColorsRouter(parent: parentRouter,
                                     viewState: viewState,
                                     colorGenerator: dependency.colorGenerator)

        let state = ColorsState()
        let viewModel = ColorsViewModel(state: state,
                                        router: router,
                                        colorGenerator: dependency.colorGenerator)

        let view = ColorsView(viewModel: viewModel, state: state, viewState: viewState)

        return ColorsResult(view: view, output: viewModel)
    }
}
