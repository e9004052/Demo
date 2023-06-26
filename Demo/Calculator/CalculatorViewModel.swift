//
//  CalculatorViewModel.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import Combine

enum CalculatorOperator { case add, subtract }

protocol CalculatorViewModel {
    func viewDidSetFirstOperand(_ value: Int)
    func viewDidSetSecondOperand(_ value: Int)
    func viewDidSetOperator(_ `operator`: CalculatorOperator)
    func viewDidToggleAdvancedOptions()
}

protocol CalculatorPublishers {}

final class CalculatorState: ObservableObject {
    @Published fileprivate(set) var firstOperand: Int
    @Published fileprivate(set) var secondOperand: Int
    @Published fileprivate(set) var `operator`: CalculatorOperator?
    @Published fileprivate(set) var result: Int

    init(firstOperand: Int, secondOperand: Int) {
        self.firstOperand = firstOperand
        self.secondOperand = secondOperand
        self.operator = .add
        self.result = firstOperand + secondOperand
    }
}

final class AppCalculatorViewModel: CalculatorViewModel, CalculatorPublishers {

    private let clearAdvancedOptionsSubject = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()

    private let state: CalculatorState
    private let module: CalculatorModule
    private let featureFlagManager: CalculatorFeatureFlagManager

    init(state: CalculatorState,
         module: CalculatorModule,
         featureFlagManager: CalculatorFeatureFlagManager) {
        self.state = state
        self.module = module
        self.featureFlagManager = featureFlagManager
    }


    func viewDidSetFirstOperand(_ value: Int) {
        state.firstOperand = value
    }

    func viewDidSetSecondOperand(_ value: Int) {
        state.secondOperand = value
    }

    func viewDidSetOperator(_ operator: CalculatorOperator) {
        state.operator = `operator`
        clearAdvancedOptionsSubject.send()
        switch `operator` {
        case .add:
            state.result = state.firstOperand + state.secondOperand
        case .subtract:
            state.result = state.firstOperand - state.secondOperand
        }
    }

    func viewDidToggleAdvancedOptions() {
        if module.hasAdvancedOptions {
            module.dismissAdvancedOptions()
            return
        }

        guard featureFlagManager.hasAdvancedOptions else { return }
        let output = module.showAdvancedOptions(
            clearOperatorPublisher: clearAdvancedOptionsSubject.eraseToAnyPublisher()
        )
        output.publishers.operator
            .receive(on: DispatchQueue.main)
            .sink { [weak self] `operator` in
                guard let self else { return }
                state.operator = nil
                switch `operator` {
                case .multiply:
                    state.result = state.firstOperand * state.secondOperand
                case .divide:
                    state.result = state.firstOperand / state.secondOperand
                }
            }
            .store(in: &cancellables)
    }
}

