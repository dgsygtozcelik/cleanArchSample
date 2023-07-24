//
//  NetworkService.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation
import Combine

protocol NetworkService {
    func request<T>(_ type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, Error> where T: Decodable
}

class DefaultNetworkService: NetworkService {
    
    func request<T>(_ type: T.Type, endpoint: Endpoint) -> AnyPublisher<T, Error> where T : Decodable {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = endpoint.configuration.scheme
        urlComponents.host = endpoint.configuration.host
        urlComponents.path = endpoint.path
        
        guard let url = urlComponents.url else {
            return Fail(error: NetworkError.invalidUrl)
                .eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}

enum NetworkError: Error {
    case invalidUrl
}
