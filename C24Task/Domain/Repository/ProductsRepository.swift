//
//  ProductsRepository.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Combine

protocol ProductsRepository {
    
    func getProducts() -> AnyPublisher<ProductsResponse, Error>
}
