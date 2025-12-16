//
// ListOfProducts
// ProductDetailView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            ImageFetchingView(url: product.image)
                .frame(width: .infinity, height: 250)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.title)
                    .font(.title)
                    .bold()
                
                Text(product.category)
                    .foregroundStyle(.secondary)
                    .font(.caption)
                
                HStack {
                    Image(systemName: "star.fill")
                    Text("\(product.rating.rate, specifier: "%.1f")")
                    
                    Image(systemName: "eye.fill")
                    Text("\(product.rating.count)")
                }
                .foregroundStyle(.secondary)
                
                Text(product.description)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
            }
        }
        .padding()
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct)
}
