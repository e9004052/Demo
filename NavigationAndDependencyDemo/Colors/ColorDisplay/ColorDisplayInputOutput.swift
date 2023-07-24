//
//  ColorDisplayInputOutput.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation

struct ColorDisplayDependency {
    let colorGenerator: ColorGenerator
}

struct ColorDisplayResult {
    let view: ColorDisplayView
    let output: ColorDisplayOutput
}
