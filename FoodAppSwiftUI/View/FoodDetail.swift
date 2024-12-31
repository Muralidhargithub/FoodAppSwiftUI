//
//  FoodDetail.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import SwiftUI

struct FoodDetail: View {
    var foodGroups: FoodGroup
     var viewModel: FoodViewModel
    
    var body: some View {
        List(foodGroups.food_items, id: \..id) { foodItem in
            FoodItemRow(foodItems: foodItem, viewModel: viewModel)
        }
        .navigationTitle(foodGroups.name ?? "")
    }
}

