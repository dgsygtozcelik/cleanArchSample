//
//  ProductsEndPoint.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

enum ProductsEndPoint {
    case get
}

extension ProductsEndPoint: Endpoint {
    
    var path: String {
        switch self {
        case .get:
            return "/products-test.json"
        }
    }
    var body: [String : String]? { nil }
    var method: RequestMethod { .get }
    var header: [String : String]? {
        ["Content-Type": "application/json;charset=utf-8"]
    }
}
