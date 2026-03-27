//
//  Product.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

// Create Product model that confirm some protocol as codable, identifiable, hashable
struct Product: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String?
    let rating: Rating
    let image: String
    let currency: String?
}

struct Rating: Codable, Hashable {
    let rate: Double
    let count: Int
}
