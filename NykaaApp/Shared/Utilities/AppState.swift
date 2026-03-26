//
//  AppState.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class AppState: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var hasSeenOnboarding: Bool = false
}
