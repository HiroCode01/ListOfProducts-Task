//
// ListOfProducts
// Products.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import Foundation

struct Products: Codable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}

struct MockData {
    static let sampleProducts = Products(id: 1,
                                         title: "Product 1",
                                         price: 10.99,
                                         description: "Description 1",
                                         category: "Category 1",
                                         image: "image1.jpg",
                                         rating: Rating(rate: 4.5,
                                                        count: 100))
}
