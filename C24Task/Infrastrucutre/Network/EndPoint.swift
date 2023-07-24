//
//  EndPoint.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

protocol Endpoint {
    
    var configuration: EndpointConfiguration { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    
    var configuration: EndpointConfiguration {
        DefaultNetworkConfiguration()
    }
}

protocol EndpointConfiguration {
    
    var scheme: String { get }
    var host: String { get }
}

struct DefaultNetworkConfiguration: EndpointConfiguration {
    
    let scheme: String = "https"
    let host: String = "app.check24.de"
}
