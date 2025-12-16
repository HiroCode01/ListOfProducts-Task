//
// ListOfProducts
// ProductsListView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ProductsListView: View {
    var products: [Product] = MockData.sampleProducts // For testing
    
    var body: some View {
        List(products, id: \.id) { product in
            HStack {
                ProductCellView(product: product)
            }
        }
        .navigationTitle("Products")
    }
}

#Preview {
    ProductsListView()
}
