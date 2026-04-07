//
//  WishlistViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class WishlistViewModel: ObservableObject {
    @Published var state: ViewState<[Product]> = .idle
    
    private let wishlist: WishlistManager
    
    init(wishlist: WishlistManager) {
        self.wishlist = wishlist
        load()
    }
    
    func load() {
        state = .success(Array(wishlist.items))
    }
}
