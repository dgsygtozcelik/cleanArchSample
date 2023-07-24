//
//  ProductPriceResponse.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

struct ProductPriceResponse: Decodable {
    
    let value: Double
    let currency: String
}
