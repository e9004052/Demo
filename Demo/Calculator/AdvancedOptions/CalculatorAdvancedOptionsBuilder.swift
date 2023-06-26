//
//  CalculatorAdvancedOptionsBuilder.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

struct CalculatorAdvancedOptionsOutput {
    let view: CalculatorAdvancedOptionsView
    let publishers: CalculatorAdvancedOptionsPublishers
}

final class CalculatorAdvancedOptionsBuilder {
    private let parent: CalculatorAdvancedOptionsModuleParent
    private let dependency: CalculatorAdvancedOptionsDependency

    init(parent: CalculatorAdvancedOptionsModuleParent,
         dependency: CalculatorAdvancedOptionsDependency) {
        self.parent = parent
        self.dependency = dependency
    }

    func build() -> CalculatorAdvancedOptionsOutput {
        let viewContainer = CalculatorAdvancedOptionsViewContainer()
        let module = AppCalculatorAdvancedOptionsModule(
            parent: parent, viewContainer: viewContainer
        )

        let state = CalculatorAdvancedOptionsState()
        let viewModel = AppCalculatorAdvancedOptionsViewModel(
            state: state, module: module, clearOperatorPublisher: dependency.clearOperatorPublisher
        )

        let view = CalculatorAdvancedOptionsView(
            viewModel: viewModel, state: state, viewContainer: viewContainer
        )

        return CalculatorAdvancedOptionsOutput(view: view, publishers: viewModel)
    }
}
