//
//  MessageListVM.swift
//  TinderClone
//
//  Created by Gustavo Dias on 25/01/23.
//

import Foundation

class MessageListVM: ObservableObject {
    @Published var messagePreviews: [MessagePreview] = []
    
    init() {
        loadPreviews()
    }
    
    func loadPreviews() {
        // Mock networking to load messagePreviews
        self.messagePreviews = MessagePreview.examples
    }
}
