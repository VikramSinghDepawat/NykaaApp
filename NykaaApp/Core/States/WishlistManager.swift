//
//  WishlistManager.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class WishlistManager: ObservableObject {
    @Published var items: Set<Product> = []
    
    func toggle(_ product: Product) {
        if items.contains(product) {
            items.remove(product)
        } else {
            items.insert(product)
        }
    }
}
