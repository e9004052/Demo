//
//  ColorsInputOutput.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import Foundation
import SwiftUI

protocol ColorGenerator {
    func makeColor() -> Color
}

struct ColorsDependency {
    let colorGenerator: ColorGenerator
}

struct ColorsResult {
    let view: ColorsView
    let output: ColorsOutput
}
