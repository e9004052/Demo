//___FILEHEADER___

import Foundation
import Combine

final class ___VARIABLE_productName___State: ObservableObject {
    // @Published fileprivate(set) var someVar: someType
}

protocol ___VARIABLE_productName___Output {
    // Publishers and things that we want to expose to the parent
}

final class ___VARIABLE_productName___ViewModel: ___VARIABLE_productName___Output {

    private let state: ___VARIABLE_productName___State
    private let router: ___VARIABLE_productName___Router

    init(state: ___VARIABLE_productName___State, router: ___VARIABLE_productName___Router) {
        self.state = state
        self.router = router
    }
}
