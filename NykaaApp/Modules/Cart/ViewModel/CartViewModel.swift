//
//  CartViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

@MainActor
final class CartViewModel: ObservableObject {
    @Published var state: ViewState<[CartItem]> = .idle
    
    private let cart: CartManager
    private var cancellables: Set<AnyCancellable> = []
    
    init(cart: CartManager) {
        self.cart = cart
        bindCart()
    }
    
    private func bindCart() {
        cart.$items
            .receive(on: RunLoop.main)
            .sink { [weak self] items in
                guard let self else { return }
                if items.isEmpty {
                    self.state = .success([])
                } else {
                    self.state = .success(items)
                }
            }
            .store(in: &cancellables)
    }
    
    var total: Double { cart.total }
    
    func load() {
        state = .success(cart.items)
    }
    
    func increase(_ id: Int) {
        guard let item = cart.items.first(where: { $0.id == id }) else { return }
        cart.add(item.product)
    }
    
    func decrease(_ id: Int) {
        guard let item = cart.items.first(where: { $0.id == id }) else { return }
        cart.decrease(item.product)
    }
    
    func remove(_ item: CartItem) {
        cart.remove(item.product)
    }
}
