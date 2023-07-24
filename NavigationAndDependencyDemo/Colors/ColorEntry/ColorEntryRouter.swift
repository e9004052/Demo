//
//  ColorEntryRouter.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

protocol ColorEntryParentRouter {}

protocol ColorEntryRouter {}

final class ColorEntryViewState: ObservableObject {}

final class AppColorEntryRouter: ColorEntryRouter {
    private let parent: ColorEntryParentRouter
    private let viewState: ColorEntryViewState

    init(parent: ColorEntryParentRouter, viewState: ColorEntryViewState) {
        self.parent = parent
        self.viewState = viewState
    }
}
