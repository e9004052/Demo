//
//  CalculatorAdvancedOptionsViewModel.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import Combine

enum CalculatorAdvancedOptionsOperator {
    case multiply, divide
}

protocol CalculatorAdvancedOptionsViewModel {
    func viewDidSelectOperator(_ operator: CalculatorAdvancedOptionsOperator)
    func viewDidSelectDummy()
}

protocol CalculatorAdvancedOptionsPublishers {
    var `operator`: AnyPublisher<CalculatorAdvancedOptionsOperator, Never> { get }
}

final class CalculatorAdvancedOptionsState: ObservableObject {
    @Published fileprivate(set) var `operator`: CalculatorAdvancedOptionsOperator?
}

final class AppCalculatorAdvancedOptionsViewModel: CalculatorAdvancedOptionsViewModel,
                                                   CalculatorAdvancedOptionsPublishers {

    var `operator`: AnyPublisher<CalculatorAdvancedOptionsOperator, Never> {
        operatorSubject.eraseToAnyPublisher()
    }
    private let operatorSubject = PassthroughSubject<CalculatorAdvancedOptionsOperator, Never>()
    private var cancellables = Set<AnyCancellable>()

    private let state: CalculatorAdvancedOptionsState
    private let module: CalculatorAdvancedOptionsModule

    init(state: CalculatorAdvancedOptionsState,
         module: CalculatorAdvancedOptionsModule,
         clearOperatorPublisher: AnyPublisher<Void, Never>) {
        self.state = state
        self.module = module

        bindTo(clearOperatorPublisher: clearOperatorPublisher)
    }

    func viewDidSelectOperator(_ operator: CalculatorAdvancedOptionsOperator) {
        state.operator = `operator`
        operatorSubject.send(`operator`)
    }

    func viewDidSelectDummy() {
        module.showDummy()
    }

    private func bindTo(clearOperatorPublisher: AnyPublisher<Void, Never>) {
        clearOperatorPublisher
            .receive(on: DispatchQueue.main)
            .map({ _ -> CalculatorAdvancedOptionsOperator? in nil })
            .assign(to: \.operator, on: state)
            .store(in: &cancellables)
    }
}
