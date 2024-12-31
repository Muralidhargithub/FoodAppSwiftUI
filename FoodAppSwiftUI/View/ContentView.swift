//
//  ContentView.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var viewModel: FoodViewModel
    var body: some View {
        NavigationView {
            List (viewModel.foodGroups, id: \..id) {
                foodGroup in
                NavigationLink(destination: FoodDetail(foodGroups: foodGroup, viewModel: viewModel)) {
                    FoodGroupView(foodGroup: foodGroup, viewModel: viewModel)
                }
            }
            .navigationTitle(Text("Food Groups"))
            .onAppear {
                viewModel.fetchData()
            }
            .overlay{
                if viewModel.isLoading {
                    ProgressView("Loading ...")
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
        //.environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
        .environmentObject(FoodViewModel(networkManager: NetworkManagerImp.shared))
}
