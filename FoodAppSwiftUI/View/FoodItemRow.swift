//
//  FoodItemRow.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import SwiftUI

struct FoodItemRow: View {
    var foodItems: FoodItem
    var viewModel: FoodViewModel
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        HStack{
            Image(uiImage: image ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .onAppear {
                    Task {
                        image = await viewModel.fetchImage(url: foodItems.image_url ?? "")
                    }
                }
            VStack(alignment: .leading) {
                Text(foodItems.name ?? "No Name")
                    .font(.headline)
                    .foregroundStyle(Color.primary)
                Text(foodItems.description ?? "No Description")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            .padding()
        }
    }
}

