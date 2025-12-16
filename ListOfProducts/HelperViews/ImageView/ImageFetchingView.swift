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
                    .frame(width: width, height: height)
                    .clipped()
            } else if phase.error != nil {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .frame(width: width, height: height)
            } else {
                ProgressView()
                    .frame(width: width, height: height)
            }
        }
        .padding(5)
        .background(.white)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    ImageFetchingView(url: MockData.sampleProduct.image, width: 300, height: 300)
}
