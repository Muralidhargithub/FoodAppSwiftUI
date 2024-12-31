//
//  NetworkManager.swift
//  FoodAppSwiftUI
//
//  Created by Muralidhar reddy Kakanuru on 12/30/24.
//

import Foundation
import UIKit

protocol NetworkManager {
    func getData<T: Decodable>(url: String)async throws -> T
    func getImage(url: String)async throws -> UIImage
}

class NetworkManagerImp: NetworkManager {
    static let shared = NetworkManagerImp()
    private let session: URLSession
    private var imageCache = NSCache<NSString, UIImage>()
    
    init() {
        let config = URLSessionConfiguration.default
        self.session = URLSession(configuration: config)
    }
    
    func getData<T: Decodable>(url: String)async throws -> T {
        guard let serverURL = URL(string: url) else { throw NetworkError.invalidURL}
        
        let (data, _) = try await session.data(from: serverURL)
        let decoded = try JSONDecoder().decode(T.self, from: data)
        return decoded
    }
    
    func getImage(url: String) async throws -> UIImage {
        if let cachedImage = imageCache.object(forKey: url as NSString) {
            return cachedImage
        }
        
        guard let serverURL = URL(string: url) else { throw NetworkError.invalidURL}
        
        let (data, _) = try await session.data(from: serverURL)
        
        guard let image = UIImage(data: data) else { throw NetworkError.invalidImageData}
        
        imageCache.setObject(image, forKey: url as NSString)
        return image
    }
}
