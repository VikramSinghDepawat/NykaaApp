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
