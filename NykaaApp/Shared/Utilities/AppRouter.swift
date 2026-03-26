//
//  AppRouter.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

enum AppRoute: Hashable {
    case splash
    case onboarding
    case login
    case registration
    case otp(String)
    case home
    case productDetail(Product)
    case cart
    case checkout
}

