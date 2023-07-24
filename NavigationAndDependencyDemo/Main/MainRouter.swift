//
//  MainRouter.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

enum MainRoute: Equatable, Hashable {
    case colors
    case numbers
}

protocol MainRouter {
    func attachColors() -> ColorsOutput
}

final class MainViewState: ObservableObject {
    @Published fileprivate(set) var routes: [MainRoute] = []
    fileprivate(set) var colorsView: ColorsView?
}

final class AppMainRouter: MainRouter, ColorsParentRouter {

    private let viewState: MainViewState

    init(viewState: MainViewState) {
        self.viewState = viewState
    }

    // MARK: - MainRouter

    func attachColors() -> ColorsOutput {
        let colorGenerator = AppColorGenerator()
        let dependency = ColorsDependency(colorGenerator: colorGenerator)
        let builder = ColorsBuilder(dependency: dependency, parentRouter: self)
        let result = builder.build()
        viewState.colorsView = result.view
        viewState.routes.append(.colors)
        return result.output
    }

    // MARK: - ColorsParentRouter

    func colorsDidSelectBack() {
        guard let index = viewState.routes.lastIndex(of: .colors) else { return }
        viewState.routes.remove(at: index)
    }
}
