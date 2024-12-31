//
//  NetworkManagerDebug.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/31/24.
//
import UIKit

class NetworkManagerDebug: NetworkManager {
    static let shared = NetworkManagerDebug()
    
    func getData<T: Decodable>(url: String) async throws -> T {
        guard let foodJsonData = foodJsonData else {
            throw NetworkError.invalidURL
        }
        do {
            let decoded = try JSONDecoder().decode(T.self, from: foodJsonData)
            return decoded
        } catch {
            throw NetworkError.decodingError("Decoding error: \(error.localizedDescription)")
        }
    }
    
    func getImage(url: String) async throws -> UIImage {
        guard let imageUrl = URL(string: url) else {
                    throw NetworkError.invalidURL
                }
                
                do {
                    let (data, _) = try await URLSession.shared.data(from: imageUrl)
                    guard let image = UIImage(data: data) else {
                        throw NetworkError.invalidImageData
                    }
                    return image
                } catch {
                    print("Failed to fetch image: \(error)")
                    throw NetworkError.networkFailure("Failed to fetch image from \(url)")
                }
            }
}

let foodJsonData = """
{
    "food_groups": [
        {"id": 1,
                "name": "Paratha",
                "description": "Try pizza cooked in a woodfire oven",
                "image_url": "https://raw.githubusercontent.com/YevhenBiiak/10-Food/main/Resources/FoodGroup%20Icons/pizza_icon.png",
                "food_items": [
                    {
                        "id": 11,
                        "name": "Margherita",
                        "description": "Tomato sauce, Mozarella, Basil",
                        "weight": 490,
                        "price": 151,
                        "image_url": "https://raw.githubusercontent.com/YevhenBiiak/10-Food/main/Resources/Pizza%20Images/1.png"
                    }
            ]
        }
    ]
}
""".data(using: .utf8)
