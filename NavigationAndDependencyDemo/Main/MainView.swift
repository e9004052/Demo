//
//  MainView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

struct MainView: View {
    private let viewModel: MainViewModel
    @ObservedObject private var state: MainState
    @ObservedObject private var viewState: MainViewState

    init(viewModel: MainViewModel,
         state: MainState,
         viewState: MainViewState) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
    }

    var body: some View {
        NavigationStack(path: Binding<[MainRoute]>(get: { viewState.routes }, set: { _ in })) {
            VStack {
                colorsButton
                numbersButton
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(for: MainRoute.self) { route in
                switch route {
                case .colors:
                    viewState.colorsView
                case .numbers:
                    EmptyView()
                }
            }
            .background(Color.white)
            .navigationTitle("Main")
        }
    }

    private var colorsButton: some View {
        Button("Colors - Previous Count \(state.previousColorCount)",
               action: { viewModel.mainDidSelectColors() })
    }

    private var numbersButton: some View {
        Button("Number", action: {  })
    }
}
