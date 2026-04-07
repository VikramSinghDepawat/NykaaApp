//
//  CheckoutView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct CheckoutView: View {
    @StateObject var viewModel: CheckoutViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Order Summary")
                .font(.title)
            
            Text("Total: ₹\(viewModel.total)")
                .bold()
            
            Button("Pay Now") {
                viewModel.placeOrder()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}

#Preview {
    CheckoutView(viewModel: CheckoutViewModel(cart: CartManager()))
}
