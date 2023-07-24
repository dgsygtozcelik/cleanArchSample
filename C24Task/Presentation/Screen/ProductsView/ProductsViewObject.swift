//
//  ProductsViewObject.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

struct ProductsViewObject: Hashable {
    
    // Header
    let headerTitle: String
    let headerDescription: String
    
    // Products
    let products: [ProductViewObject]
    
}

struct ProductViewObject: Hashable {

    let name: String
    let type: String
    let id: Int
    let color: String
    let imageURL: String
    let colorCode: String
    let available: Bool
    let releaseDate: Double
    let description: String
    let longDescription: String
    let rating: Double
    let price: String
}

