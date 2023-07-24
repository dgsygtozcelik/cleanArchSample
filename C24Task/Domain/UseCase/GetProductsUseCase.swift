//
//  GetProductsUseCase.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Combine

struct GetProductsUseCase: UseCase {

    typealias Input = String
    typealias Output = ProductsViewObject

    var repository: ProductsRepository

    func execute() -> AnyPublisher<ProductsViewObject, Error> {
        repository.getProducts()
            .map { $0.transform() }
            .eraseToAnyPublisher()
    }
}


