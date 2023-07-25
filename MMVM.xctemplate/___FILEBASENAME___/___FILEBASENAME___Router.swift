//___FILEHEADER___

import Foundation

protocol ___VARIABLE_productName___ParentRouter {
    // Any navigation action we want to delegate to the parent to handle
}

protocol ___VARIABLE_productName___Router {
    // Methods and properties that will be used by the VM
}

final class ___VARIABLE_productName___ViewState: ObservableObject {}

final class App___VARIABLE_productName___Router: ___VARIABLE_productName___Router {
    private let parent: ___VARIABLE_productName___ParentRouter
    private let viewState: ___VARIABLE_productName___ViewState

    init(parent: ___VARIABLE_productName___ParentRouter, viewState: ___VARIABLE_productName___ViewState) {
        self.parent = parent
        self.viewState = viewState
    }
}
