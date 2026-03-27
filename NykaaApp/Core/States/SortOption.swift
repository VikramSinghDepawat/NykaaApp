//
//  SortOption.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

enum SortOption: String, CaseIterable {
    case none = "None"
    case priceLowToHigh = "Price ↑"
    case priceHighToLow = "Price ↓"
    case rating = "Rating"
    
    var title: String {
        rawValue
    }
}
