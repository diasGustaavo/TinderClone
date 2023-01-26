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
    @Published var topPicks: [Person] = []
    
    init() {
        loadUser()
        loadMatches()
        loadTopPicks()
    }
    
    private func loadTopPicks() {
        self.topPicks = Person.examples.shuffled()
    }
    
    private func loadUser() {
        self.currentUser = User.example
        loadMatches()
    }
    
    private func loadMatches() {
        self.matches = Person.examples
    }
}
