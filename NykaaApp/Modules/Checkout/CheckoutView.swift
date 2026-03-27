//
//  CheckoutView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct CheckoutView: View {
    @StateObject var vm: CheckoutViewModel
    
    var body: some View {
        VStack {
            Text("Total: \(vm.total)")
            Button("Pay Now") {}
        }
    }
}

#Preview {
    CheckoutView(vm: CheckoutViewModel(cart: CartManager()))
}
