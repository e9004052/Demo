//___FILEHEADER___

import SwiftUI

struct ___VARIABLE_productName___View: View {
    private let viewModel: ___VARIABLE_productName___ViewModel
    @ObservedObject private var state: ___VARIABLE_productName___State
    @ObservedObject private var viewState: ___VARIABLE_productName___ViewState

    init(viewModel: ___VARIABLE_productName___ViewModel, state: ___VARIABLE_productName___State, viewState: ___VARIABLE_productName___ViewState) {
        self.viewModel = viewModel
        self.state = state
        self.viewState = viewState
    }

    var body: some View {
        EmptyView()
    }
}
