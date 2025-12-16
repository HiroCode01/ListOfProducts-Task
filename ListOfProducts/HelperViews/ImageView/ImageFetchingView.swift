//
// ListOfProducts
// ImageFetchingView.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct ImageFetchingView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFit()
                    .padding(5)
                    .frame(width: width, height: height)
                    .clipped()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .padding(5)
                    .frame(width: width, height: height)
            } else {
                ProgressView()
                    .tint(.blue)
                    .frame(width: width, height: height)
            }
        }
        .background(.white)
    }
}

#Preview {
    ImageFetchingView(url: MockData.sampleProduct.image, width: 300, height: 300)
}
