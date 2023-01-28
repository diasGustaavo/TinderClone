//
//  FullScreenCardView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 28/01/23.
//

import SwiftUI

struct FullScreenCardView: View {
    var person: Person
    
    @Binding var fullScreenMode: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    CardImageScroller(person: person, fullScreenMode: $fullScreenMode)
                        .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight * 0.6)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text(person.name)
                                    .font(.system(size: 32, weight: .heavy))
                                
                                Text(String(person.age))
                                    .font(.system(size: 28, weight: .light))
                                
                                Spacer()
                            }
                            .opacity(0.75)
                            
                            Text("\(person.distance) Km away")
                                .font(.system(size: 18 , weight: .medium))
                                .opacity(0.75)
                        }
                        .padding([.horizontal, .top], 16)
                        
                        Button {
                            //action
                        } label: {
                            Image(systemName: "arrow.down.circle.fill")
                                .font(.system(size: 42))
                                .background(Color.white)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 16)
                        .offset(y: -40)
                    }
                    
                    Spacer().frame(height: 26)
                    
                    HStack {
                        Text(person.bio)
                            .font(.system(size: 18, weight: .medium))
                            .lineLimit(20)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                            .opacity(0.75)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    
                    Spacer().frame(height: 32)
                    
                    VStack(spacing: 24) {
                        Button {
                            // test
                        } label: {
                            VStack(spacing: 8) {
                                Text("SHARE \(person.name.uppercased())'S PROFILE")
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("SEE WHAT A FRIEND THINKS")
                                    .font(.system(size: 14, weight: .medium))
                            }
                            .opacity(0.9)
                        }
                        
                        Button {
                            // test
                        } label: {
                            VStack(spacing: 8) {
                                Text("REPORT \(person.name.uppercased())")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .opacity(0.75)
                            }
                            .opacity(0.9)
                        }
                    }
                    
                    Spacer().frame(height: 200)
                }
            }
        }
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
    }
}
