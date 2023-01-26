//
//  UserManager.swift
//  TinderClone
//
//  Created by Gustavo Dias on 26/01/23.
//

import Foundation

class UserManager: ObservableObject {
    @Published var currentUser: User = User(name: "")
    
    init() {
        loadUser()
    }
    
    private func loadUser() {
        self.currentUser = User.example
    }
}
