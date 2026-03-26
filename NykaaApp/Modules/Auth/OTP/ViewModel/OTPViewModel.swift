//
//  OTPViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

@MainActor
final class OTPViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var state: ViewState<Bool> = .idle
    
    private let service: AuthService
    private let coordinator: AppCoordinator
    private let appState: AppState
    
    init(service: AuthService, coordinator: AppCoordinator, appState: AppState) {
        self.service = service
        self.coordinator = coordinator
        self.appState = appState
    }
    
    func verifyOTP() async {
        state = .loading
        
        do {
            let result = try await service.verifyOTP(otp: code)
            
            if result {
                state = .success(true)
                appState.isLoggedIn = true
                coordinator.reset()
                coordinator.push(.home)
            } else {
                state = .error("Invalid OTP")
            }
            
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}

