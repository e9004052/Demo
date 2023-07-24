//
//  ContentView.swift
//  NavigationAndDependencyDemo
//
//  Created by Son Nguyen on 7/24/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let dependency = MainDependency()
        let builder = MainBuilder(dependency: dependency)
        return builder.build().view
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
