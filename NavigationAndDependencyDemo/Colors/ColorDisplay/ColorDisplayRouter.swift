//
//  ColorDisplayRouter.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

protocol ColorDisplayParentRouter {
    func colorDisplayDidGoBack()
}

protocol ColorDisplayRouter {
    func goBack()
}

final class ColorDisplayViewState: ObservableObject {}

final class AppColorDisplayRouter: ColorDisplayRouter {
    private let parent: ColorDisplayParentRouter
    private let viewState: ColorDisplayViewState

    init(parent: ColorDisplayParentRouter, viewState: ColorDisplayViewState) {
        self.parent = parent
        self.viewState = viewState
    }

    func goBack() {
        parent.colorDisplayDidGoBack()
    }
}
