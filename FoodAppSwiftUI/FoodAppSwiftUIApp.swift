//
//  FoodAppSwiftUIApp.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import SwiftUI

@main
struct FoodAppSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: FoodViewModel(networkManager: NetworkManagerImp.shared))
        }
    }
}
