//
//  ProductDetailViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

@MainActor
final class ProductDetailViewModel: ObservableObject {
    
    @Published var state: ViewState<Product> = .idle
    @Published var showAdded = false
    
    private let cart: CartManager
    private let wishlist: WishlistManager
    
    init(product: Product,
         cart: CartManager,
         wishlist: WishlistManager) {
        self.cart = cart
        self.wishlist = wishlist
        self.state = .success(product)
    }
    
    func addToCart(_ product: Product) {
        cart.add(product)
        showAdded = true
        
        Task {
            try? await Task.sleep(nanoseconds: 1_500_000_000)
            showAdded = false
        }
    }
    
    func toggleWishlist(_ product: Product) {
        wishlist.toggle(product)
    }
    
    func isWishlisted(_ product: Product) -> Bool {
        wishlist.isWishlisted(product)
    }
}
