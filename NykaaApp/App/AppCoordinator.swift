//
//  AppCoordinator.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

final class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ router: AppRoute) {
        path.append(router)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func reset() {
        path = NavigationPath()
    }
}
