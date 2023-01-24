//
//  ChatView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var chatMng: ChatManager
    
    @State private var typingMessage: String = ""
    
    private var person: Person
    
    init(person: Person) {
        self.chatMng = ChatManager(person: person)
        self.person = person
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                Spacer().frame(height: 85)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack {
                        ForEach(chatMng.messages.indices, id: \.self) { index in
                            let msg = chatMng.messages[index]
                            MessageView(message: msg)
                        }
                    }
                }
                
                ZStack(alignment: .trailing) {
                    Color.textfieldBG
                    
                    TextField("Type a message", text: $typingMessage)
                        .foregroundColor(Color.textPrimary)
                        .textFieldStyle(PlainTextFieldStyle())
                        .frame(height: 45)
                    .padding(.horizontal)
                    
                    Button {
                        sendMessage()
                    } label: {
                        Text("Send")
                    }
                    .padding(.horizontal)
                    .foregroundColor(typingMessage.isEmpty ? Color.textPrimary : Color.blue)
                }
                .frame(height: 40)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                )
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            ChatViewHeader(name: person.name, imageURL: person.imageURLS.first) {
                // video action
            }
            .padding(.top)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
    }
    
    func sendMessage() {
        chatMng.sendMessage(Message(content: typingMessage))
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(person: Person.example)
    }
}
