//
//  ColorDummyRouter.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/25/23.
//

import Foundation

protocol ColorDummyParentRouter {
    // Any navigation action we want to delegate to the parent to handle
}

protocol ColorDummyRouter {
    // Methods and properties that will be used by the VM
}

final class ColorDummyViewState: ObservableObject {}

final class AppColorDummyRouter: ColorDummyRouter {
    private let parent: ColorDummyParentRouter
    private let viewState: ColorDummyViewState

    init(parent: ColorDummyParentRouter, viewState: ColorDummyViewState) {
        self.parent = parent
        self.viewState = viewState
    }
}
