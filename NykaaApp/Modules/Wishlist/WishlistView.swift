//
//  WishlistView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct WishlistView: View {
    
    @StateObject var viewModel: WishlistViewModel
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
            
        case .success(let items):
            if items.isEmpty {
                Text("No items in wishlist ❤️")
            } else {
                List(items) { product in
                    Text(product.title)
                }
            }
            
        case .loading:
            ProgressView()
            
        case .error(let msg):
            Text(msg)
            
        default:
            EmptyView()
        }
    }
}

#Preview {
    WishlistView(viewModel: WishlistViewModel(wishlist: WishlistManager()))
}
