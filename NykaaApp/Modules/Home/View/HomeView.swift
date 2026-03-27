//
//  HomeView.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            filterBar
            content
        }
        .task {
            await viewModel.loadProducts()
        }
    }
    
    @ViewBuilder
    var content: some View {
        switch viewModel.state {
            
        case .idle:
            EmptyView()
            
        case .loading:
            ProgressView()
            
        case .success(let products):
            ProductGrid(products: products)
            
        case .error(let message):
            VStack {
                Text(message)
                Button("Retry") {
                    Task { await viewModel.loadProducts() }
                }
            }
        }
    }
    
    @ViewBuilder
    var filterBar: some View {
        HStack {
            
            Button("All") {
                viewModel.selectedCategory = nil
            }
            
            Button("Electronics") {
                viewModel.selectedCategory = "electronics"
            }
            Spacer()
            Menu("Sort") {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Button(option.title) {
                        viewModel.sortOption = option
                        viewModel.applyFilters()
                    }
                }
            }
        }
        .padding()
    }
}
