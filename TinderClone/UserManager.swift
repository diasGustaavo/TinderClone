//
//  UserManager.swift
//  TinderClone
//
//  Created by Gustavo Dias on 26/01/23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    @Published var matches: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
    }
    
    private func loadUser() {
        self.currentUser = User.example
        loadMatches()
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
}
