//
//  WishlistManager.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class WishlistManager: ObservableObject {
    @Published private(set) var items: Set<Product> = []
    
    private let storageKey = "wishlist_items"
    
    init() {
        load()
    }
    
    func toggle(_ product: Product) {
        if items.contains(product) {
            items.remove(product)
        } else {
            items.insert(product)
        }
        save()
    }
    
    func isWishlisted(_ product: Product) -> Bool {
        items.contains(product)
    }
    
    // MARK: - Persistence
    
    private func save() {
        if let data = try? JSONEncoder().encode(Array(items)) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: storageKey),
           let decoded = try? JSONDecoder().decode([Product].self, from: data) {
            items = Set(decoded)
        }
    }
}
