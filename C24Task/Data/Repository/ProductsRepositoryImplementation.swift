//
//  ProductsRepositoryImplementation.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Combine

struct ProductsRepositoryImplementation: ProductsRepository {

    var datasource: ProductsDataSource

    func getProducts() -> AnyPublisher<ProductsResponse, Error> {
        datasource.getProducts()
    }
}
