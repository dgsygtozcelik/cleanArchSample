//
//  ProductsDataSource.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Combine

protocol ProductsDataSource {
    func getProducts() -> AnyPublisher<ProductsResponse, Error>
}


struct ProductsDataSourceImplementation: ProductsDataSource {
    
    let networkService: NetworkService
    
    func getProducts() -> AnyPublisher<ProductsResponse, Error> {
        networkService.request(ProductsResponse.self, endpoint: ProductsEndPoint.get)
    }
}
