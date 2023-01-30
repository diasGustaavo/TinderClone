//
//  CardStack.swift
//  TinderClone
//
//  Created by Gustavo Dias on 30/01/23.
//

import SwiftUI

struct CardStack: View {
    var people: [Person]
    
    @State private var fullscreenMode: Bool = false
    
    var body: some View {
        ZStack {
            ForEach(people) { person in
                CardView(person: person, fullScreenMode: $fullscreenMode)
            }
        }
        .frame(width: UIScreen.screenWidth, height: fullscreenMode ? UIScreen.screenHeight : 550)
    }
}

struct CardStack_Previews: PreviewProvider {
    static var previews: some View {
        CardStack(people: Person.examples)
    }
}
