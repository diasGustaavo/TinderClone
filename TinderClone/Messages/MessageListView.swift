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
        VStack {
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
            
            Spacer()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        MessageListView()
    }
}
