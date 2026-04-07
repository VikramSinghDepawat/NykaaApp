//
//  CartItem.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

struct CartItem: Codable, Identifiable, Equatable {
    let id: Int
    let product: Product
    var quantity: Int
    
    init(product: Product, quantity: Int) {
        self.id = product.id
        self.product = product
        self.quantity = quantity
    }
}
