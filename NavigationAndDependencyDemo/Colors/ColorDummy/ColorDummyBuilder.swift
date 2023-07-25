//
//  ColorDummyBuilder.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/25/23.
//

final class ColorDummyBuilder {
    private let dependency: ColorDummyDependency
    private let parentRouter: ColorDummyParentRouter

    init(dependency: ColorDummyDependency, parentRouter: ColorDummyParentRouter) {
        self.dependency = dependency
        self.parentRouter = parentRouter
    }

    func build() -> ColorDummyResult {
        let viewState = ColorDummyViewState()
        let router = AppColorDummyRouter(parent: parentRouter, viewState: viewState)

        let state = ColorDummyState()
        let viewModel = ColorDummyViewModel(state: state, router: router)

        let view = ColorDummyView(viewModel: viewModel, state: state, viewState: viewState)

        return ColorDummyResult(view: view, output: viewModel)
    }
}
