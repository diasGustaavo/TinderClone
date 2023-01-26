//
//  User.swift
//  TinderClone
//
//  Created by Gustavo Dias on 26/01/23.
//

import Foundation

struct User {
    var name: String
    var goldSubscriber: Bool = false
}

extension User {
    static let example = User(name: "Alex", goldSubscriber: false)
}
