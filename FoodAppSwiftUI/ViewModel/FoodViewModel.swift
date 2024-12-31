//
//  FoodViewModel.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import Foundation
import UIKit
import Observation

@Observable class FoodViewModel {
    var foodGroups: [FoodGroup] = []
    var isLoading: Bool = false
    
    private var networkManager: NetworkManager
    
    init(networkManager: NetworkManager ) {
        self.networkManager = networkManager
    }
    
    func fetchData() {
        isLoading = true
        Task {
            do {
                let storedData: FoodData = try await networkManager.getData(url: ServerConstants.serverURL)
                DispatchQueue.main.async {
                    self.foodGroups = storedData.food_groups
                    self.isLoading = false
                }
            }
            catch {
                print("error not fetched \(error)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
        }
    }
    
    func fetchImage(url: String)async -> UIImage? {
        do {
            return try await networkManager.getImage(url: url)
        }
        catch {
            print("cant able to fetch image from url because of \(error)")
            return nil
        }
    }
}
