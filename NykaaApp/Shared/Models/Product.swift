//
//  Product.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

// Create Product model that confirm some protocol as codable, identifiable, hashable
struct Product: Codable, Identifiable, Hashable {
    var id: String
    var title: String
    var price: Double
    var currency: String
    var rating: Rating
    var image: String
    var description: String
    var category: String
}

struct Rating: Codable, Hashable {
    var rate: Double
    var count: Int
}
