//
//  MainViewModel.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import Combine

final class MainState: ObservableObject {
    @Published fileprivate(set) var previousColorCount: Int = 0
}

protocol MainOutput {}

final class MainViewModel: MainOutput {

    private var colorsSubscription: AnyCancellable?
    
    private let state: MainState
    private let router: MainRouter
    
    init(state: MainState, router: MainRouter) {
        self.state = state
        self.router = router
    }

    func mainDidSelectColors() {
        let output = router.attachColors()
        colorsSubscription = output.colorCountPublisher
            .receive(on: DispatchQueue.main)
            .assign(to: \.previousColorCount, on: state)
    }
}
