//
//  CheckoutViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class CheckoutViewModel: ObservableObject {
    private let cart: CartManager
    
    init(cart: CartManager) {
        self.cart = cart
    }
    
    var total: Double {
        cart.total
    }
}
