//
// ListOfProducts
// ProductCellView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ProductCellView: View {
    let product: Product
    
    var body: some View {
        Group {
            ImageFetchingView(url: product.image)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .frame(width: 120, height: 90)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

#Preview {
    ProductCellView(product: MockData.sampleProduct)
}
