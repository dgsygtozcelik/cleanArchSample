//
//  C24TaskApp.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import SwiftUI

@main
struct C24TaskApp: App {
    var body: some Scene {
        WindowGroup {
            ProductsView(viewModel: .configure(()))
        }
    }
}


