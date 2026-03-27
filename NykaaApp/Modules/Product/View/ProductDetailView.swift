//
//  ProductDetailView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct ProductDetailView: View {
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        ScrollView {
            content
                .padding()
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .error(let message): Text(message)
        case .loading: ProgressView()
        case .success(let product):
            productUI(product)
        default:
            EmptyView()
        }
    }

    @ViewBuilder
    private func productUI(_ product: Product) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            productImage(product)
            productInfo(product)
            actionButtons(product)
            if viewModel.showAdded {
                Text("Added to cart ✅")
            }
        }
        .padding()
    }
    
    private func productImage(_ product: Product) -> some View {
        AsyncImage(url: URL(string: product.image)) { img in
            img.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(height: 250)
    }
    
    private func productInfo(_ product: Product) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            Text(product.title)
                .font(.headline)
            
            Text("₹\(product.price)")
                .font(.title2)
                .bold()
            
            HStack {
                Text("⭐ \(product.rating.rate)")
                Text("(\(product.rating.count) reviews)")
                    .foregroundColor(.gray)
            }
            
            Text(product.description)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private func actionButtons(_ product: Product) -> some View {
        HStack {
            
            Button {
                viewModel.toggleWishlist(product)
            } label: {
                Image(
                    systemName: viewModel
                        .isWishlisted(product) ? "heart.fill" : "heart"
                )
            }
            
            Spacer()
            
            Button("Add to Cart") {
                viewModel.addToCart(product)
            }
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
