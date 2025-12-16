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
                    .onTapGesture {
                        viewModel.selectedProduct = product
                    }
                }
                .navigationTitle("Products")
            }
            .task { viewModel.getProducts() }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: alert.dismissButton)
            }
            .sheet(item: $viewModel.selectedProduct, content: { product in
                ProductDetailView(product: product)
            })
            
            if viewModel.isLoading {
                ProgressView()
            }
        }
    }
}

#Preview {
    ProductsListView()
}
