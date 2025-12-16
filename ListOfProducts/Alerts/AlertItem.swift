//
// ListOfProducts
// Alert.swift
//
// Created by HiRO on 16/12/2025
// Copyright © 2025 ACME. All Rights Reserved.


import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text("There was an issue connecting to the server"), dismissButton: .default(Text("OK")))
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Invalid response from the server. Please try again later."), dismissButton: .default(Text("OK")))
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("The data returned from the server is invalid"), dismissButton: .default(Text("OK")))
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete the request"), dismissButton: .default(Text("OK")))
}
