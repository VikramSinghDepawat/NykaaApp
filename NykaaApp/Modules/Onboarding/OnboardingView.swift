//
//  OnboardingView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject private var appState: AppState
    
    var body: some View {
        VStack {
            Text("Welcome to Nykaa Fashion.")
                .font(.title2)
                .bold()
            
            Button("Get Started") {
                appState.hasSeenOnboarding = true
                appState.authState = .unauthenticated
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView()
}
