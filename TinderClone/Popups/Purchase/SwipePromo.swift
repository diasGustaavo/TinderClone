//
//  SwipePromo.swift
//  TinderClone
//
//  Created by Gustavo Dias on 27/01/23.
//

import SwiftUI

struct SwipePromo: View {
    var body: some View {
        TabView {
            VStack(spacing: 10) {
                Image(systemName: "thermometer.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already liked you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them instantly")
            }
            
            VStack(spacing: 10) {
                Image(systemName: "paperplane.circle.fill")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already liked you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them instantly")
            }
            
            VStack(spacing: 10) {
                Image(systemName: "calendar.badge.plus")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 75)
                
                Text("25 people already liked you!")
                    .font(.system(size: 18, weight: .semibold))
                
                Text("Match with them instantly")
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct SwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        SwipePromo()
            .frame(height: UIScreen.screenHeight / 3)
    }
}
