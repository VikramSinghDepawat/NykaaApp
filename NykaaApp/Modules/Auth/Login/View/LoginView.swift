//
//  LoginView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("Enter phone/email", text: $viewModel.input)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom, 20)
            
            Button("Send OTP") {
                Task { await viewModel.sendOTP() }
            }
            .buttonBorderShape(.roundedRectangle)
            .padding()
            
            content
        }
        .padding()
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
        case .idle: EmptyView()
        case .loading: ProgressView()
        case .success: EmptyView()
        case .error(let msg): Text(msg).foregroundStyle(.red)
            
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(service: AuthServiceImpl(), coordinator: AppCoordinator()))
}
