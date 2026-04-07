//
//  RootView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        switch appState.authState {
            
        case .unknown:
            SplashView()
            
        case .unauthenticated:
            AuthFlowView()
            
        case .authenticated:
            MainTabView()
        }
    }
}

struct AuthFlowView: View {
    @EnvironmentObject var coordinator: AppCoordinator
    @EnvironmentObject var cart: CartManager
    @EnvironmentObject var wishlist: WishlistManager
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            LoginView(
                viewModel: LoginViewModel(
                    service: AuthServiceImpl(),
                    coordinator: coordinator
                )
            )
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .auth(let authRoute):
                    handleAuthRoute(authRoute)
                case .main(let route):
                    switch route {
                    case .home, .cart, .checkout:
                         MainTabView()
                    case .productDetail(let product):
                        ProductDetailView(
                            viewModel: ProductDetailViewModel(
                                product: product,
                                cart: cart,
                                wishlist: wishlist
                            )
                        )
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    private func handleAuthRoute(_ route: AuthRoute) -> some View {
        switch route {
        case .onboarding:
            OnboardingView()
        case .login:
            EmptyView()
        case .registration:
            Text("Register")
        case .otp:
            OTPView(
                viewModel: OTPViewModel(
                    service: AuthServiceImpl(),
                    coordinator: coordinator,
                    appState: AppState()
                )
            )
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppCoordinator())
        .environmentObject(AppState())
}
