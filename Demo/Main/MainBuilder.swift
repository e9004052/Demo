//
//  MainBuilder.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

struct MainOutput {
    let view: MainView
    let publishers: MainPublishers
}

final class MainBuilder {
    private let dependency: MainDependency

    init(dependency: MainDependency) {
        self.dependency = dependency
    }

    func build() -> MainOutput {
        let viewContainer = MainViewContainer()
        let module = AppMainModule(
            viewContainer: viewContainer, featureFlagManager: dependency.featureFlagManager
        )

        let state = MainState()
        let viewModel = AppMainViewModel(state: state, module: module)

        let view = MainView(viewModel: viewModel, state: state, viewContainer: viewContainer)

        return MainOutput(view: view, publishers: viewModel)
    }
}
