//
//  ProductCardViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class ProductCardViewModel: ObservableObject {
    private let cart: CartManager
    private let wishlist: WishlistManager
    private let coordinator: AppCoordinator
    
    init(cart: CartManager, wishlist: WishlistManager, coordinator: AppCoordinator) {
        self.cart = cart
        self.wishlist = wishlist
        self.coordinator = coordinator
    }
    
    func addToCart(_ product: Product) {
        cart.add(product)
    }
    
    func toggleWishlist(_ product: Product) {
        wishlist.toggle(product)
    }
    
    func openDetail(_ product: Product) {
        coordinator.push(.main(.productDetail(product)))
    }
}
