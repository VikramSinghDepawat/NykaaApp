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
                        
                    case .onboarding:
                        OnboardingView()
                        
                    case .login:
                        LoginView(
                            viewModel: LoginViewModel(
                                service: AuthServiceImpl(),
                                coordinator: coordinator
                            )
                        )
                        
                    case .otp(let input):
                        OTPView(
                            viewModel: OTPViewModel(
                                service: AuthServiceImpl(),
                                coordinator: coordinator,
                                appState: AppState()
                            )
                        )
                        
                    case .home:
                        MainTabView()
                        
                    default:
                        EmptyView()
                    }
                }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(AppCoordinator())
}
