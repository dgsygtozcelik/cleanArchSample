//
//  UseCase.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Combine

protocol UseCase {
    
    associatedtype Input
    associatedtype Output
    associatedtype Failure = Error

    func execute(param: Input) -> AnyPublisher<Output, Error>
}

extension UseCase {
    func execute(param: Input) -> AnyPublisher<Output, Error> {
        fatalError("Not implemented function")
    }
}
