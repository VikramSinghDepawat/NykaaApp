//
//  LoginViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    @Published var state: ViewState<Void> = .idle
    @Published var input = ""
    
    private let service : AuthService
    private let coordinator: AppCoordinator
    
    init(service: AuthService, coordinator: AppCoordinator) {
        self.service = service
        self.coordinator = coordinator
    }
    
    func sendOTP() async {
        state = .loading
        do {
            try await service.sendOTP(to: input)
            state = .success(())
            coordinator.push(.auth(.otp(input)))
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
