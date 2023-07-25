//
//  ColorDummyView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/25/23.
//

import SwiftUI

struct ColorDummyView: View {
    private let viewModel: ColorDummyViewModel
    @ObservedObject private var state: ColorDummyState
    @ObservedObject private var viewState: ColorDummyViewState

    init(viewModel: ColorDummyViewModel, state: ColorDummyState, viewState: ColorDummyViewState) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
    }

    var body: some View {
        Text("I'm a dummy view, I serve no purpose other than showing that a sub view can be a MVVM component")
            .foregroundStyle(.black)
    }
}
