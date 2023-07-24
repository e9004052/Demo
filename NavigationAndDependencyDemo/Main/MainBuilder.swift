//
//  MainBuilder.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

final class MainBuilder {
    private let dependency: MainDependency

    init(dependency: MainDependency) {
        self.dependency = dependency
    }

    func build() -> MainResult {
        let viewState = MainViewState()
        let router = AppMainRouter(viewState: viewState)

        let state = MainState()
        let viewModel = MainViewModel(state: state, router: router)

        let view = MainView(viewModel: viewModel, state: state, viewState: viewState)

        return MainResult(view: view, output: viewModel)
    }
}
