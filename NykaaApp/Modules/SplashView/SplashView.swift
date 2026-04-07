//
//  SplashView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct SplashView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Text("Nykaa")
            .font(.largeTitle)
            .bold()
            .task {
                try? await Task.sleep(nanoseconds: 1_500_000_000)
                
                if !appState.hasSeenOnboarding {
                    appState.authState = .unauthenticated
                } else {
                    appState.authState = .unauthenticated
                }
            }
    }
}

#Preview {
    SplashView()
        .environmentObject(AppState())
}
