//
//  CalculatorAdvancedOptionsView.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import SwiftUI

struct CalculatorAdvancedOptionsView: View {

    private let viewModel: CalculatorAdvancedOptionsViewModel
    @ObservedObject private var state: CalculatorAdvancedOptionsState
    @ObservedObject private var viewContainer: CalculatorAdvancedOptionsViewContainer

    internal init(viewModel: CalculatorAdvancedOptionsViewModel,
                  state: CalculatorAdvancedOptionsState,
                  viewContainer: CalculatorAdvancedOptionsViewContainer) {
        self.viewModel = viewModel
        self.state = state
        self.viewContainer = viewContainer
    }

    var body: some View {
        VStack {
            HStack {
                Button("x", action: { viewModel.viewDidSelectOperator(.multiply) })
                    .padding()
                    .border(.black)
                Button("/", action: { viewModel.viewDidSelectOperator(.divide) })
                    .padding()
                    .border(.black)
            }

            Button("Dummy", action: { viewModel.viewDidSelectDummy() })
        }
    }
}
