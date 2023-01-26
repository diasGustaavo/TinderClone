//
//  Person.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import Foundation

struct Person: Hashable, Identifiable {
    var id = UUID().uuidString
    
    var name: String
    var imageURLS: [URL]
    var bio: String
    var age: Int
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLS: [URL(string: "https://picsum.photos/400/300")!],
        bio: "Im into cats",
        age: 21
    )
    static let example2 = Person(
        name: "Samantha",
        imageURLS: [URL(string: "https://picsum.photos/400/301")!],
        bio: "I really like pizza",
        age: 24
    )
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(
            name: "Olivia",
            imageURLS: [URL(string: "https://picsum.photos/400/302")!],
            bio: "I love hiking",
            age: 30
        ),
        Person(
            name: "Sophia",
            imageURLS: [URL(string: "https://picsum.photos/400/303")!],
            bio: "I am really boring",
            age: 28
        ),
        Person(
            name: "Mia",
            imageURLS: [URL(string: "https://picsum.photos/400/304")!],
            bio: "I like to skateboard",
            age: 22
        )
    ]
}
