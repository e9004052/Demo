//
//  CalculatorAdvancedOptionsModule.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

protocol CalculatorAdvancedOptionsModule {
    func showDummy()
}

protocol CalculatorAdvancedOptionsModuleParent: AnyObject {
    func showDummy()
}

final class CalculatorAdvancedOptionsViewContainer: ObservableObject {}

final class AppCalculatorAdvancedOptionsModule: CalculatorAdvancedOptionsModule {

    private let parent: CalculatorAdvancedOptionsModuleParent
    private let viewContainer: CalculatorAdvancedOptionsViewContainer

    init(parent: CalculatorAdvancedOptionsModuleParent,
         viewContainer: CalculatorAdvancedOptionsViewContainer) {
        self.parent = parent
        self.viewContainer = viewContainer
    }

    func showDummy() {
        parent.showDummy()
    }
}
