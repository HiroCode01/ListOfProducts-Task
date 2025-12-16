//
// ListOfProducts
// ProductsListView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ProductsListView: View {
    @StateObject var viewModel = ProductsListViewModel()
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(viewModel.product, id: \.id) { product in
                    HStack {
                        ProductCellView(product: product)
                    }
                    .onTapGesture { viewModel.selectedProduct = product }
                    .listRowSeparator(.hidden)
                }
                .navigationDestination(item: $viewModel.selectedProduct) { product in
                    ProductDetailView(product: product)
                }
                .navigationTitle("Products")
                .listStyle(.plain)
            }
            .task { viewModel.getProducts() }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            }
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    ProductsListView()
}
