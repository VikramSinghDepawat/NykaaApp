//
//  MainTabView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject var cart: CartManager
    @EnvironmentObject var wishlist: WishlistManager
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        TabView {
            
            HomeView(
                viewModel: HomeViewModel(service: ProductServiceImpl())
            )
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            WishlistView(
                viewModel: WishlistViewModel(wishlist: wishlist)
            )
            .tabItem {
                Label("Wishlist", systemImage: "heart")
            }
            
            CartView(
                viewModel: CartViewModel(cart: cart)
            )
            .tabItem {
                Label("Cart", systemImage: "bag")
            }
        }
    }
}

#Preview {
    MainTabView()
        .environmentObject(WishlistManager())
        .environmentObject(CartManager())
        .environmentObject(AppCoordinator())
}
