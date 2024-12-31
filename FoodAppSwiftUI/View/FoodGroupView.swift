//
//  FoodGroup.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import SwiftUI

//struct FoodGroupView: View {
//    var foodGroup: FoodGroup
//    @ObservedObject var viewModel: FoodViewModel
//    @State private var image: UIImage? = nil
//    
//    var body: some View {
//        HStack{
//            Image(uiImage: image ?? UIImage(systemName: "photo")!)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 80, height: 80)
//                .cornerRadius(8)
//                .onAppear {
//                    Task {
//                        image = await viewModel.fetchImage(url: foodGroup.image_url ?? "")
//                    }
//                }
//            VStack(alignment: .leading) {
//                Text(foodGroup.name ?? "No Name")
//                    .font(.headline)
//                    .foregroundStyle(Color.primary)
//                Text(foodGroup.description ?? "No Description")
//                    .font(.subheadline)
//                    .foregroundStyle(Color.secondary)
//            }
//            .padding()
//        }
//    }
//}
struct FoodGroupView: View {
    let foodGroup: FoodGroup
    @ObservedObject var viewModel: FoodViewModel
    @State private var image: UIImage? = nil
    @Environment(\.colorScheme) var colorScheme // Accessing system value

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            Image(uiImage: image ?? UIImage(systemName: "photo")!)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .cornerRadius(8)
                .onAppear {
                    Task {
                        image = await viewModel.fetchImage(url: foodGroup.image_url ?? "")
                    }
                }

            VStack(alignment: .leading, spacing: 8) {
                Text(foodGroup.name ?? "Unknown Name")
                    .font(.headline)
                    .foregroundColor(colorScheme == .dark ? .blue : .black) // Adjust text color
                Text(foodGroup.description ?? "No Description")
                    .font(.subheadline)
                    .foregroundColor(colorScheme == .dark ? .gray : .secondary) // Adjust text color
            }
        }
        .padding(.vertical, 8)
    }
}
