//
//  NykaaAppApp.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

@main
struct NykaaApp: App {
    @StateObject var coordinator = AppCoordinator()
    @StateObject var appState = AppState()
    @StateObject var cartManager = CartManager()
    @StateObject var wishlistManager = WishlistManager()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(coordinator)
                .environmentObject(appState)
                .environmentObject(cartManager)
                .environmentObject(wishlistManager)
        }
    }
}
