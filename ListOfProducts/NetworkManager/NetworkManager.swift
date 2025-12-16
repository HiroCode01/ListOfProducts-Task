//
// ListOfProducts
// NetworkManager.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL = "https://fakestoreapi.com/products"
    
    private init() {}
    
    func getProducts() async throws -> [Product] {
        guard let url = URL(string: baseURL) else {
            throw NetworkError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        
        do {
            let products = try decoder.decode([Product].self, from: data)
            return products
        } catch {
            throw NetworkError.invalidData
        }
    }
}
