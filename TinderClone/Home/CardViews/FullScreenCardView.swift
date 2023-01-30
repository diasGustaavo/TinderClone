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
    
    @EnvironmentObject var userMng: UserManager
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Color.white
                .edgesIgnoringSafeArea(.all)
            
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
                            fullScreenMode = false
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
                            showActionSheet()
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
            
            HStack(spacing: 20) {
                Spacer()
                
                CircleButtonView(type: .no) {
                    fullScreenMode = false
                    userMng.swipe(person, .no)
                }
                .frame(height: 55)
                
                CircleButtonView(type: .star) {
                    fullScreenMode = false
                    userMng.superLike(person)
                }
                .frame(height: 50)
                
                CircleButtonView(type: .heart) {
                    fullScreenMode = false
                    userMng.swipe(person, .like)
                }
                .frame(height: 55)
                
                Spacer()
            }
            .padding(.top, 25)
            .padding(.bottom, 45)
            .edgesIgnoringSafeArea(.bottom)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.2), Color.white]), startPoint: .top, endPoint: .bottom)
            )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func showActionSheet() {
        let items: [Any] = ["What do you think about \(person.name)? \n"]
        let av = UIActivityViewController(activityItems: items, applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
    }
}

struct FullScreenCardView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCardView(person: Person.example, fullScreenMode: .constant(true))
    }
}
