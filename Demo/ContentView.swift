//
//  ContentView.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import SwiftUI

private class FeatureFlagManager: CalculatorFeatureFlagManager {
    var hasAdvancedOptions: Bool { true }
}

struct ContentView: View {
    var body: some View {
        let dependency = MainDependency(featureFlagManager: FeatureFlagManager())
        let builder = MainBuilder(dependency: dependency)
        builder.build().view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
