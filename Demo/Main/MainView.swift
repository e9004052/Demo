//
//  MainView.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation
import SwiftUI

struct MainView: View {
    private let viewModel: MainViewModel
    @ObservedObject private var state: MainState
    @ObservedObject private var viewContainer: MainViewContainer

    init(viewModel: MainViewModel,
         state: MainState,
         viewContainer: MainViewContainer) {
        self.viewModel = viewModel
        self.state = state
        self.viewContainer = viewContainer
    }

    var body: some View {
        NavigationStack(path: $viewContainer.navigationPaths) {
            Button("Calculator", action: { viewModel.viewDidSelectCalculator() })
                .navigationDestination(for: MainNavigationPath.self) { path in
                    switch path {
                    case .calculator:
                        viewContainer.calculator
                    case .dummy:
                        viewContainer.dummy
                    }
                }
        }
    }
}
