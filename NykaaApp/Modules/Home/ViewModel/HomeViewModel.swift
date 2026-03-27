//
//  HomeViewModel.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import SwiftUI
import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    @Published var state: ViewState<[Product]> = .idle
    
    // Filter
    @Published var selectedCategory: String? {
        didSet { applyFilters() }
    }
    
    @Published var sortOption: SortOption = .none {
        didSet { applyFilters() }
    }
    
    private let service: ProductService
    private var allProducts: [Product] = []
    
    init(service: ProductService) {
        self.service = service
    }
    
    func loadProducts() async {
        state = .loading
        
        do {
            let products = try await service.fetchProducts()
            self.allProducts = products
            applyFilters()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func applyFilters() {
        var filtered = allProducts
        
        if let category = selectedCategory {
            filtered = filtered.filter { $0.category == category }
        }
        
        switch sortOption {
        case .priceLowToHigh:
            filtered.sort { $0.price < $1.price }
        case .priceHighToLow:
            filtered.sort { $0.price > $1.price }
        case .rating:
            filtered.sort { $0.rating.rate > $1.rating.rate }
        case .none:
            break
        }
        
        state = .success(filtered)
    }
}
