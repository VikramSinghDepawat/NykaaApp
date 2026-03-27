//
//  CartView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct CartView: View {
    @StateObject var viewModel: CartViewModel
    @EnvironmentObject var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            content
            checkoutBar
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .success(let items):
            if items.isEmpty {
                Text("Your cart is empty 🛒")
            } else {
                List(items) { item in
                    cartRow(item)
                }
            }
        case .loading: ProgressView()
        case .error(let message): Text(message)
        default:
            EmptyView()
        }
    }
    
    private func cartRow(_ item: CartItem) -> some View {
        HStack {
            Text(item.product.title)
            Spacer()
            HStack {
                Button("-") {
                    viewModel.decrease(item.product)
                }
                
                Text("\(item.quantity)")
                
                Button("+") {
                    viewModel.increase(item.product)
                }
            }
        }
    }
    
    private var checkoutBar: some View {
        VStack {
            Text("Total: ₹\(viewModel.total)")
                .bold()
            
            Button("Checkout") {
                coordinator.push(.main(.checkout))
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    CartView(viewModel: CartViewModel(cart: CartManager()))
}

