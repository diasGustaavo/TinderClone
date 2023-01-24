//
//  ChatView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    
    private var person: Person
    
    init(person: Person) {
        self.chatMng = ChatManager(person: person)
        self.person = person
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                ForEach(chatMng.messages.indices, id: \.self) { index in
                    let msg = chatMng.messages[index]
                    MessageView(message: msg)
                }
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
