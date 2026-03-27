//
//  CartItem.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

struct CartItem: Codable, Identifiable {
    let id: UUID
    let product: Product
    var quantity: Int
    
    init(id: UUID = UUID(), product: Product, quantity: Int) {
        self.id = id
        self.product = product
        self.quantity = quantity
    }
}
