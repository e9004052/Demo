//
//  ColorDummyViewModel.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/25/23.
//

import Foundation
import Combine

final class ColorDummyState: ObservableObject {
    // @Published fileprivate(set) var someVar: someType
}

protocol ColorDummyOutput {
    // Publishers and things that we want to expose to the parent
}

final class ColorDummyViewModel: ColorDummyOutput {

    private let state: ColorDummyState
    private let router: ColorDummyRouter

    init(state: ColorDummyState, router: ColorDummyRouter) {
        self.state = state
        self.router = router
    }
}
