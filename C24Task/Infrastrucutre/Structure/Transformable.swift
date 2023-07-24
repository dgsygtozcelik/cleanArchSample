//
//  Transformable.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

protocol Transformable {
    associatedtype ViewObject
    func transform() -> ViewObject
}
