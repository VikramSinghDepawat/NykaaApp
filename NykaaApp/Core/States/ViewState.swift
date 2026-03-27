//
//  ViewState.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

enum ViewState<T> {
    case idle
    case loading
    case success(T)
    case error(String)
}

extension ViewState: Equatable where T: Equatable {
    static func == (lhs: ViewState<T>, rhs: ViewState<T>) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle), (.loading, .loading):
            return true
        case (.success(let l), .success(let r)):
            return l == r
        case (.error(let l), .error(let r)):
            return l == r
        default:
            return false
        }
    }
}
