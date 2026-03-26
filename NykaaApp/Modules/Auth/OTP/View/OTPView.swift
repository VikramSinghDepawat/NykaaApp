//
//  OTPView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct OTPView: View {
    @StateObject var viewModel: OTPViewModel
    
    var body: some View {
        VStack {
            TextField("Enter OTP", text: $viewModel.code)
            
            Button("Verify") {
                Task { await viewModel.verifyOTP() }
            }
            
            content
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
            
        case .loading:
            ProgressView()
            
        case .error(let msg):
            Text(msg).foregroundColor(.red)
            
        default:
            EmptyView()
        }
    }
}
#Preview {
    OTPView(viewModel: OTPViewModel(service: AuthServiceImpl(), coordinator: AppCoordinator(), appState: AppState()))
}
