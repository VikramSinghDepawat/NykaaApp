//
//  AppRouter.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

enum AppRoute: Hashable {
    case auth(AuthRoute)
    case main(MainRoute)
}

enum AuthRoute: Hashable {
    case onboarding
    case login
    case registration
    case otp(String)
}

enum MainRoute: Hashable {
    case home
    case productDetail(Product)
    case cart
    case checkout
}
