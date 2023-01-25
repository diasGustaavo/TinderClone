//
//  Person.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import Foundation

struct Person: Hashable {
    var name: String
    var imageURLS: [URL]
    var bio: String
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!],
        bio: "Im into cats"
    )
    static let example2 = Person(
        name: "Samantha",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really like pizza"
    )
}
