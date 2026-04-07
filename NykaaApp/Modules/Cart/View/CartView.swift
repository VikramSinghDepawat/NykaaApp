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
        }
    }
    
    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .success(let items):
            if items.isEmpty {
                emptyView
            } else {
                cartList(items)
                checkoutBar
            }
        case .loading, .idle: ProgressView()
        case .error(let message): Text(message)
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        guard case let .success(items) = viewModel.state else { return }
        
        withAnimation {
            offsets.map { items[$0] }
                .forEach { viewModel.remove($0) }
        }
    }
    
    private var emptyView: some View {
        VStack(spacing: 12) {
            Text("Your cart is empty 🛒")
            Text("Add items to continue shopping")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
    
    private func cartList(_ items: [CartItem]) -> some View {
        List {
            cartRow(items)
        }
        .animation(.easeInOut, value: items)
    }
    
    private func cartRow(_ items: [CartItem]) -> some View {
        ForEach(items, id: \.id) { item in
            HStack {
                Text(item.product.title)
                Spacer()
                HStack {
                    Button {
                        viewModel.decrease(item.id)
                    } label: {
                        Image(systemName: "minus.circle")
                    }
                    .padding()
                    
                    Text("\(item.quantity)")
                        .padding()
                    
                    Button {
                        viewModel.increase(item.id)
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                    .padding()
                }
            }
            .id(item.id)
        }
        .onDelete(perform: deleteItems)        
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

