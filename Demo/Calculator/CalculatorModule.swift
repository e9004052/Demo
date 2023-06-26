//
//  CalculatorModule.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import Combine

protocol CalculatorModuleParent: AnyObject {
    func showDummy()
}

protocol CalculatorModule {
    var hasAdvancedOptions: Bool { get }

    func showAdvancedOptions(
        clearOperatorPublisher: AnyPublisher<Void, Never>
    ) -> CalculatorAdvancedOptionsOutput
    func dismissAdvancedOptions()
}

final class CalculatorViewContainer: ObservableObject {
    @Published fileprivate(set) var advancedOptions: CalculatorAdvancedOptionsView?
}

final class AppCalculatorModule: CalculatorModule, CalculatorAdvancedOptionsModuleParent {

    var hasAdvancedOptions: Bool { viewContainer.advancedOptions != nil }

    private let parent: CalculatorModuleParent
    private let viewContainer: CalculatorViewContainer

    init(parent: CalculatorModuleParent, viewContainer: CalculatorViewContainer) {
        self.parent = parent
        self.viewContainer = viewContainer
    }

    func showAdvancedOptions(
        clearOperatorPublisher: AnyPublisher<Void, Never>
    ) -> CalculatorAdvancedOptionsOutput {
        let dependency = CalculatorAdvancedOptionsDependency(
            clearOperatorPublisher: clearOperatorPublisher
        )
        let builder = CalculatorAdvancedOptionsBuilder(parent: self, dependency: dependency)
        let output = builder.build()
        viewContainer.advancedOptions = output.view
        return output
    }

    func dismissAdvancedOptions() {
        viewContainer.advancedOptions = nil
    }

    func showDummy() {
        parent.showDummy()
    }
}
