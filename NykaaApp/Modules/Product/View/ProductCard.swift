//
//  ProductCard.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct ProductCard: View {
    let product: Product
    let viewModel: ProductCardViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.image)) { img in
                img.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 150)
            
            Text(product.title)
                .font(.caption)
                .lineLimit(2)
            
            Text("₹\(product.price)")
                .bold()
            
            HStack {
                Button("Add") {
                    viewModel.addToCart(product)
                }
                
                Button {
                    viewModel.toggleWishlist(product)
                } label: {
                    Image(systemName: "heart")
                        .foregroundColor(.red)
                }
            }
        }
        .onTapGesture {
            viewModel.openDetail(product)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}
