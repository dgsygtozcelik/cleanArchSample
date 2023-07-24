//
//  ProductsResponse.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

struct ProductsResponse: Decodable {
    
    let header: ProductHeaderResponse
    let products: [ProductResponse]
}

extension ProductsResponse: Transformable {
    
    func transform() -> ProductsViewObject {
        
        let products = self.products.map({
            $0.transform()
        })
        
        return ProductsViewObject(headerTitle: header.headerTitle,
                           headerDescription: header.headerDescription,
                           products: products)
    }
}
