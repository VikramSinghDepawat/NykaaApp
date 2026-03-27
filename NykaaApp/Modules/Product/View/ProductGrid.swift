//
//  ProductView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct ProductGrid: View {
    let products: [Product]
    @EnvironmentObject var cart: CartManager
    @EnvironmentObject var wishlist: WishlistManager
    @EnvironmentObject var coordinator: AppCoordinator
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(products) { product in
                    ProductCard(
                        product: product,
                        viewModel: ProductCardViewModel(
                            cart: cart,
                            wishlist: wishlist,
                            coordinator: coordinator
                        )
                    )
                }
            }
            .padding()
        }
    }
}
