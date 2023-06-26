//
//  CalculatorView.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import SwiftUI

struct CalculatorView: View {

    private let viewModel: CalculatorViewModel
    @ObservedObject private var state: CalculatorState
    @ObservedObject private var viewContainer: CalculatorViewContainer

    init(viewModel: CalculatorViewModel,
         state: CalculatorState,
         viewContainer: CalculatorViewContainer) {
        self.viewModel = viewModel
        self.state = state
        self.viewContainer = viewContainer
    }

    var body: some View {
        VStack {
            operands
            result
            operators
            viewContainer.advancedOptions
            advancedButton
        }
        .padding(32)
        .animation(.easeInOut, value: viewContainer.advancedOptions != nil)
    }

    private var operands: some View {
        HStack {
            TextField(
                "First operand",
                text: Binding<String>(
                    get: { "\(state.firstOperand)" },
                    set: { newValue in guard
                        let number = Int(newValue) else { return}
                        viewModel.viewDidSetFirstOperand(number)
                    }
                )
            )
            .frame(maxWidth: .infinity)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField(
                "Second operand",
                text: Binding<String>(
                    get: { "\(state.secondOperand)" },
                    set: { newValue in guard
                        let number = Int(newValue) else { return}
                        viewModel.viewDidSetSecondOperand(number)
                    }
                )
            )
            .frame(maxWidth: .infinity)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }

    private var result: some View {
        Text("\(state.result)")
    }

    private var operators: some View {
        HStack {
            Button("+", action: { viewModel.viewDidSetOperator(.add) })
                .padding()
                .border(.black)
            Button("-", action: { viewModel.viewDidSetOperator(.subtract) })
                .padding()
                .border(.black)
        }
    }

    private var advancedButton: some View {
        Button(
            (viewContainer.advancedOptions != nil ? "Hide " : "Show ") + "advanced options",
            action: { viewModel.viewDidToggleAdvancedOptions() }
        )
    }
}
