//
//  CalculatorBuilder.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

struct CalculatorOutput {
    let view: CalculatorView
    let publishers: CalculatorPublishers
}

class CalculatorBuilder {
    private let dependency: CalculatorDependency
    private let parent: CalculatorModuleParent

    init(parent: CalculatorModuleParent,
         dependency: CalculatorDependency) {
        self.parent = parent
        self.dependency = dependency
    }

    func build(initialOperands: [Int]) -> CalculatorOutput {
        let viewContainer = CalculatorViewContainer()
        let module = AppCalculatorModule(parent: parent, viewContainer: viewContainer)

        let state = CalculatorState(
            firstOperand: initialOperands.first ?? 0, secondOperand: initialOperands.last ?? 0
        )
        let viewModel = AppCalculatorViewModel(
            state: state, module: module, featureFlagManager: dependency.featureFlagManager
        )

        let view = CalculatorView(viewModel: viewModel, state: state, viewContainer: viewContainer)

        return CalculatorOutput(view: view, publishers: viewModel)
    }
}
