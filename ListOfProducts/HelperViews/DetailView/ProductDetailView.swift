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
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ImageFetchingView(url: product.image, width: geometry.size.width, height: 300)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.title.bold())
                            .foregroundColor(.blue)
                        
                        Text(product.title)
                            .font(.title2)
                        
                        HStack(spacing: 16) {
                            ProductDetailCaption(systemImageTitle: "bag.fill", text: product.category)
                            
                            ProductDetailCaption(systemImageTitle: "star.fill", text: "\(product.rating.rate)")
                            
                            ProductDetailCaption(systemImageTitle: "eye.fill", text: "\(product.rating.count)")
                        }
                        .padding(.vertical, 16)
                        
                        Text(product.description)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.leading)
                            .lineSpacing(4)
                    }
                    .padding(.horizontal)
                }
            }
            .scrollIndicators(.hidden)
            .scrollBounceBehavior(.basedOnSize)
        }
    }
}

#Preview {
    ProductDetailView(product: MockData.sampleProduct)
}

struct ProductDetailCaption: View {
    let systemImageTitle: String
    let text: String
    
    var body: some View {
        HStack {
            Image(systemName: systemImageTitle)
            
            Text(text)
        }
        .foregroundStyle(.secondary)
        .font(.headline)
    }
}
