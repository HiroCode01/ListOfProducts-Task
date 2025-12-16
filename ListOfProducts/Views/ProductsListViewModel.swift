//
// ListOfProducts
// ProductsListViewModel.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI
import Combine

final class ProductsListViewModel: ObservableObject {
    @Published var product: [Product] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var selectedProduct: Product?
    
    func getProducts() {
        isLoading = true
        
        Task {
            do {
                product = try await NetworkManager.shared.getProducts()
                isLoading = false
            } catch {
                if let error = error as? NetworkError {
                    switch error {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                alertItem = AlertContext.invalidResponse
                isLoading = false
            }
        }
    }
}
