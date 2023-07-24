//
//  ViewState.swift
//  C24Task
//
//  Created by Bewerber  on 30.06.23.
//

import Foundation

enum ViewState<ViewObject> {
    case idle
    case loading
    case loaded(ViewObject)
    case error(Error)
}
