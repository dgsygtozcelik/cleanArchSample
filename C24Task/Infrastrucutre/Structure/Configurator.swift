//
//  Configurator.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

protocol Configurator {
    
    associatedtype ViewModel
    associatedtype Input
    static func configure(_ param: Input) -> ViewModel
    static func mock() -> ViewModel
}
