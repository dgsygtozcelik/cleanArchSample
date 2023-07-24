//
//  ProductResponse.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

struct ProductResponse: Decodable {
    
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
    let price: ProductPriceResponse
}

extension ProductResponse: Transformable {
    
    func transform() -> ProductViewObject {
        
        ProductViewObject(name: name,
                          type: type,
                          id: id,
                          color: color,
                          imageURL: imageURL,
                          colorCode: color,
                          available: available,
                          releaseDate: releaseDate,
                          description: description,
                          longDescription: longDescription,
                          rating: rating,
                          price: "\(price.value) \(price.currency)")
    }
}
