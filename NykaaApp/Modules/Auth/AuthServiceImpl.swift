//
//  AuthServiceImpl.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

enum AuthError: Error {
    case invalidOTP
    case network
}

protocol AuthService {
    func sendOTP(to input: String) async throws
    func verifyOTP(otp: String) async throws -> Bool
}

final class AuthServiceImpl: AuthService {
    func sendOTP(to input: String) async throws {
        try await Task.sleep(nanoseconds: 1_000_000_000)
    }
    
    func verifyOTP(otp: String) async throws -> Bool {
        if otp == "1234" {
            return true
        } else {
            throw AuthError.invalidOTP
        }
    }
}



