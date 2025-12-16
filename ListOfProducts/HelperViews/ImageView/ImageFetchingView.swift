//
// ListOfProducts
// ImageFetchingView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ImageFetchingView: View {
    let url: String
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            } else {
                ProgressView()
            }
        }
    }
}

#Preview {
    ImageFetchingView(url: MockData.sampleProduct.image)
}
