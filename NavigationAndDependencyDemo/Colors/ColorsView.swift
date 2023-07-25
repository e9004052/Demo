//
//  ColorsView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

struct ColorsView: View {
    private let viewModel: ColorsViewModel
    @ObservedObject private var state: ColorsState
    @ObservedObject private var viewState: ColorsViewState

    @State private var shown = false

    init(viewModel: ColorsViewModel,
         state: ColorsState,
         viewState: ColorsViewState) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
    }

    var body: some View {
        Button("Start") {
            shown = true
        }
        .fullScreenCover(isPresented: $shown) {
            mainView
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
    }

    private var mainView: some View {
        NavigationStack(path: $viewState.routes) {
            VStack {
                content
                HStack {
                    backButton
                    addButton
                }
                toggleDummyButton
                viewState.dummyView
            }
            .navigationDestination(for: ColorsRoute.self) { route in
                switch route {
                case .display:
                    viewState.colorDisplay
                }
            }
            .background(Color.white)
        }
    }

    private var content: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(Array(state.colors.keys).sorted(by: { $0.uuidString.compare($1.uuidString) == .orderedAscending }), id: \.self) { id in
                    makeEntry(forId: id)
                }
            }
        }
    }

    private var toggleDummyButton: some View {
        Button("Toggle dummy", action: { viewModel.colorsDidToggleDummy() })
            .padding(.top)
    }

    private var addButton: some View {
        Button("Add", action: { viewModel.colorsDidSelectAdd() })
    }

    private var backButton: some View {
        Button("Back", action: { viewModel.colorsDidSelectBack() })
    }

    private func makeEntry(forId id: UUID) -> some View {
        HStack {
            Button("Display", action: { viewModel.colorsDidSelectDisplay(forId: id) })
            viewState.colorEntryView(forId: id)
        }
        .id(id)
    }
}
