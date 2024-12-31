//
//  FoodItem.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//


import SwiftUI

// MARK: - Models
struct FoodItem: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let weight: Int?
    let price: Int?
    let image_url: String
}

struct FoodGroup: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let image_url: String?
    let food_items: [FoodItem]
}

struct FoodData: Codable {
    let food_groups: [FoodGroup]
}