//
//  CartViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class CartViewModel: ObservableObject {
    @Published var state: ViewState<[CartItem]> = .idle
    
    private let cart: CartManager
    
    init(cart: CartManager) {
        self.cart = cart
        load()
    }
    
    var total: Double { cart.total }
    
    func load() {
        state = .success(cart.items)
    }
    
    func remove(_ product: Product) {
        cart.remove(product)
        load()
    }
    
    func increase(_ product: Product) {
        cart.add(product)
        load()
    }
    
    func decrease(_ product: Product) {
        cart.remove(product)
        load()
    }
}
