//
//  Person.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import Foundation

struct Person {
    var name: String
    var imageURLS: [URL]
}

extension Person {
    static let example = Person(name: "Alex", imageURLS: [URL(string: "https://picsum.photos/400/300")!])
}
