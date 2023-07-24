//
//  ColorDisplayView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

struct ColorDisplayView: View {
    private let viewModel: ColorDisplayViewModel
    @ObservedObject private var state: ColorDisplayState
    @ObservedObject private var viewState: ColorDisplayViewState

    init(viewModel: ColorDisplayViewModel,
         state: ColorDisplayState,
         viewState: ColorDisplayViewState) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
    }

    var body: some View {
        ZStack {
            state.color
            VStack {
                Button("Back", action: { viewModel.colorDisplayDidSelectBack() })
                Button("Change Color", action: { viewModel.colorDisplayDidSelectUpdateColor() })
            }
        }
    }
}
