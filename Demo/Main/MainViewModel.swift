//
//  MainViewModel.swift
//  Demo
//
//  Created by Son Nguyen on 6/23/23.
//

import Foundation

protocol MainViewModel {
    func viewDidSelectCalculator()
}

protocol MainPublishers {}

final class MainState: ObservableObject {}

final class AppMainViewModel: MainViewModel, MainPublishers {

    private let state: MainState
    private let module: MainModule

    init(state: MainState, module: MainModule) {
        self.state = state
        self.module = module

        viewDidSelectCalculator()
    }

    func viewDidSelectCalculator() {
        _ = module.showCalcuator()
    }
}
