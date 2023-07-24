//
//  ColorEntryView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

struct ColorEntryView: View {
    private let viewModel: ColorEntryViewModel
    @ObservedObject private var state: ColorEntryState
    @ObservedObject private var viewState: ColorEntryViewState

    private let color: Color

    init(viewModel: ColorEntryViewModel,
         state: ColorEntryState,
         viewState: ColorEntryViewState,
         color: Color) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
        self.color = color
    }

    var body: some View {
        HStack {
            color
            Button("Remove", action: { viewModel.colorEntryDidSelectRemove() })
        }
        .frame(height: 48)
    }
}
