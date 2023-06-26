//
//  MainModule.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import SwiftUI

enum MainNavigationPath {
    case calculator, dummy
}

protocol MainModule {
    func showCalcuator() -> CalculatorOutput
}

final class MainViewContainer: ObservableObject {
    @Published fileprivate(set) var calculator: CalculatorView?
    @Published fileprivate(set) var dummy: Color?

    var navigationPaths: [MainNavigationPath] {
        get {
            [calculator != nil ? .calculator : nil, dummy != nil ? .dummy : nil]
                .compactMap({ $0 })
        }
        set {
            if !newValue.contains(.calculator) { calculator = nil }
            if !newValue.contains(.dummy) { dummy = nil }
        }
    }
}

final class AppMainModule: MainModule, CalculatorModuleParent {

    private let viewContainer: MainViewContainer
    private let featureFlagManager: CalculatorFeatureFlagManager

    init(viewContainer: MainViewContainer,
         featureFlagManager: CalculatorFeatureFlagManager) {
        self.viewContainer = viewContainer
        self.featureFlagManager = featureFlagManager
    }

    func showCalcuator() -> CalculatorOutput {
        let dependency = CalculatorDependency(featureFlagManager: featureFlagManager)
        let builder = CalculatorBuilder(parent: self, dependency: dependency)
        let output = builder.build(initialOperands: [1, 2])
        viewContainer.calculator = output.view
        return output
    }

    func showDummy() {
        viewContainer.dummy = Color.red
    }
}
