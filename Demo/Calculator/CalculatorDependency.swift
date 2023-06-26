//
//  CalculatorDependency.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

protocol CalculatorFeatureFlagManager {
    var hasAdvancedOptions: Bool { get }
}

struct CalculatorDependency {
    let featureFlagManager: CalculatorFeatureFlagManager
}
