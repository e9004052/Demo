//
//  ColorsRouter.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import SwiftUI

enum ColorsRoute: Hashable {
    case display
}

protocol ColorsParentRouter {
    func colorsDidSelectBack()
}

protocol ColorsRouter {
    func goBack()

    func attachColorDisplay(_ color: Color) -> ColorDisplayOutput

    func attachColorEntry(_ color: Color, forId id: UUID) -> ColorEntryOutput
    func detachColorEntry(withId id: UUID)
}

final class ColorsViewState: ObservableObject {
    @Published var routes: [ColorsRoute] = []
    
    fileprivate(set) var colorDisplay: ColorDisplayView?
    fileprivate var colorEntries: [UUID: ColorEntryView] = [:]

    func colorEntryView(forId id: UUID) -> ColorEntryView? {
        colorEntries[id]
    }
}

final class AppColorsRouter: ColorsRouter, ColorDisplayParentRouter, ColorEntryParentRouter {
    private let parent: ColorsParentRouter
    private let viewState: ColorsViewState

    private let colorGenerator: ColorGenerator

    init(parent: ColorsParentRouter, viewState: ColorsViewState, colorGenerator: ColorGenerator) {
        self.parent = parent
        self.viewState = viewState
        self.colorGenerator = colorGenerator
    }

    // MARK: - ColorsRouter

    func goBack() {
        parent.colorsDidSelectBack()
    }

    func attachColorDisplay(_ color: Color) -> ColorDisplayOutput {
        let dependency = ColorDisplayDependency(colorGenerator: colorGenerator)
        let builder = ColorDisplayBuilder(dependency: dependency, parentRouter: self)
        let result = builder.build(forColor: color)
        viewState.colorDisplay = result.view
        viewState.routes.append(.display)
        return result.output
    }

    func attachColorEntry(_ color: Color, forId id: UUID) -> ColorEntryOutput {
        let dependency = ColorEntryDependency()
        let builder = ColorEntryBuilder(dependency: dependency, parentRouter: self)
        let result = builder.build(forColor: color)
        viewState.colorEntries[id] = result.view
        return result.output
    }

    func detachColorEntry(withId id: UUID) {
        viewState.colorEntries.removeValue(forKey: id)
    }

    // MARK: - ColorDisplayParentRouter

    func colorDisplayDidGoBack() {
        detachColorDisplay()
    }

    // MARK: - Private

    private func detachColorDisplay() {
        viewState.colorDisplay = nil
        viewState.routes.removeAll(where: { $0 == .display })
    }
}
