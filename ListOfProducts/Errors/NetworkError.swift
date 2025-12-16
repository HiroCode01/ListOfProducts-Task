//
// ListOfProducts
// NetworkError.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
