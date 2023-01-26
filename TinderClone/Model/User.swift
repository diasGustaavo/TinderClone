//
//  User.swift
//  TinderClone
//
//  Created by Gustavo Dias on 26/01/23.
//

import Foundation

struct User {
    var name: String
    var age: Int
    var jobTitle: String
    
    var goldSubscriber: Bool = false
    var profileTip: String = ""
    
    var imageURLS: [URL] = []
}

extension User {
    static let example = User(
        name: "Alex",
        age: 21,
        jobTitle: "Software Engineer",
        goldSubscriber: false,
        profileTip: "Photo Tip: Make Waves with a beach photo and get more likes",
        imageURLS: [URL(string: "https://picsum.photos/400")!])
}
