//
//  CartManager.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine


final class CartManager: ObservableObject {
    @Published var items: [Product] = []
    
    var total: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    func add(_ product: Product) {
        items.append(product)
    }
}
