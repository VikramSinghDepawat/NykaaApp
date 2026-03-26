//
//  RootView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            SplashView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .home:
                        MainTabView()
                    case .cart:
                        CartView()
                    case .checkout:
                        CheckoutView()
                    default:
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    RootView()
}
