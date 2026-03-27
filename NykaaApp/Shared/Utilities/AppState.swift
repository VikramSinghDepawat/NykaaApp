//
//  AppState.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

enum AuthState {
    case unknown
    case unauthenticated
    case authenticated
}

final class AppState: ObservableObject {
    @Published var authState: AuthState = .unknown
    @Published var hasSeenOnboarding: Bool = false
}
