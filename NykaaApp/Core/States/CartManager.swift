//
//  CartManager.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine


final class CartManager: ObservableObject {
    @Published private(set) var items: [CartItem] = []
    
    private var storageKey = "cart_items"
    
    init() {
        load()
    }
    
    var total: Double {
        items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
    
    // MARK: - Public API
    func add(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
        save()
    }
    
    func remove(_ product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            if items[index].quantity > 1 {
                items[index].quantity -= 1
            } else {
                items.remove(at: index)
            }
        }
        save()
    }
    
    func updateQuantity(for product: Product, quantity: Int) {
        guard let index = items.firstIndex(where: { $0.product.id == product.id }) else { return }
        items[index].quantity = max(1, quantity)
        save()
    }
    
    
    // MARK: - Persistence
    private func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([CartItem].self, from: data) {
            items = decoded
        }
    }
}




