//
//  ChatManager.swift
//  TinderClone
//
//  Created by Gustavo Dias on 24/01/23.
//

import Foundation

class ChatManager: ObservableObject {
    @Published var messages: [Message] = []
    
    private var person: Person
    
    init(person: Person) {
        self.person = person
        loadMessages()
    }
    
    public func sendMessage(_ message: Message) {
        messages.append(message)
    }
    
    private func loadMessages() {
        messages = [Message.exampleSent, Message.exampleReceived]
    }
}
