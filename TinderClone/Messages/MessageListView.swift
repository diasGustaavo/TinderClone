//
//  MessageListView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 25/01/23.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var vm: MessageListVM = MessageListVM()
    @State private var searchText: String = ""
    @State private var isEditing: Bool = false
    @State private var animationAmount = 1.0
    
    var body: some View {
        ScrollView {
            VStack {
                // SEARCH BAR
                HStack {
                    TextField("Search Matches", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.textfieldBG)
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.textPrimary)
                                    .font(.system(size: 20, weight: .bold))
                                    .padding(.leading, 4)
                                
                                Spacer()
                            }
                        )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        withAnimation() {
                            self.isEditing = true
                        }
                    }
                    
                    if self.isEditing {
                        Button {
                            withAnimation {
                                self.isEditing = false
                                self.searchText = ""
                                UIApplication.shared.endEditing()
                            }
                        } label: {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                    }
                }
                
                Spacer().frame(height: 14)
                
                ZStack {
                    VStack {
                        ForEach(vm.messagePreviews.filter( {searchText.isEmpty ? true : displayPreview($0)} ), id: \.self) { preview in
                            withAnimation {
                                NavigationLink {
                                    ChatView(person: preview.person)
                                } label: {
                                    MessageRowView(preview: preview)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    if isEditing && searchText.isEmpty {
                        Color.white.opacity(0.5)
                    }
                }
                
                Spacer()
            }
        }
        .modifier(HideNavigationView())
    }
    
    func displayPreview(_ preview: MessagePreview) -> Bool {
        // person name
        if preview.person.name.contains (searchText) { return true }
        // last message sent
        if preview.lastMessage.contains (searchText) { return true }
        // person bio
        if preview.person.bio.contains (searchText) { return true }
        
        return false
    }
        
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MessageListView()
        }
    }
}
