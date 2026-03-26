//
//  SplashView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        Text("Nykaa")
            .font(.largeTitle)
            .bold()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    if !appState.hasSeenOnboarding {
                        coordinator.push(.onboarding)
                    } else if !appState.isLoggedIn {
                        coordinator.push(.login)
                    } else {
                        coordinator.push(.home)
                    }
                }
            }
    }
}

#Preview {
    SplashView()
}
