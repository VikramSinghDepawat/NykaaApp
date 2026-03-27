//
//  ProductServiceImpl.swift
//  NykaaApp
//
//  Created by Vikram Singh Depawat on 26/03/26.
//

import Foundation

protocol ProductService {
    func fetchProducts() async throws -> [Product]
}

final class ProductServiceImpl: ProductService {
    
    func fetchProducts() async throws -> [Product] {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              200...299 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode([Product].self, from: data)
    }
}
