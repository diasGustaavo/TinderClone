//
//  ProfileView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userMng: UserManager
    @EnvironmentObject var appState: AppStateManager
    
    var user: User {
        return userMng.currentUser
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // PHOTO
                ZStack(alignment: .topTrailing) {
                    RoundedImage(url: user.imageURLS.first)
                        .frame(height: UIScreen.screenWidth * 0.45)
                    Button {
                        // action
                    } label: {
                        Image(systemName: "pencil")
                            .font(.system(size: 18, weight: .heavy))
                            .foregroundColor(Color.gray.opacity(0.5))
                            .frame(width: 32, height: 32)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(radius: 6)
                    }
                    .padding(.vertical, 10)
                    .offset(x: -10)
                }
                
                Spacer().frame(height: 18)
                
                // NAME + JOB TITLE
                Group {
                    Text("\(user.name), \(user.age)")
                        .foregroundColor(.textTitle)
                        .font(.system(size: 26, weight: .medium))
                    
                    Spacer().frame(height: 6)
                    
                    Text(user.jobTitle)
                    
                    Spacer().frame(height: 22)
                }
                
                // MAIN BUTTONS
                HStack(alignment: .top) {
                    Spacer()
                    
                    Button {
                        // action
                    } label: {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .font(.system(size: UIScreen.screenWidth * 0.08))
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 6)
                            
                            Text("SETTINGS")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        // action
                    } label: {
                        VStack {
                            Image(systemName: "camera.fill")
                                .foregroundColor(Color.white)
                                .font(.system(size: UIScreen.screenWidth * 0.1))
                                .padding(22)
                                .background(Color.red)
                                .clipShape(Circle())
                                .shadow(radius: 6)
                            
                            Text("ADD MEDIA")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        // action
                    } label: {
                        VStack {
                            Image(systemName: "shield.fill")
                                .foregroundColor(Color.gray.opacity(0.5))
                                .font(.system(size: UIScreen.screenWidth * 0.08))
                                .padding(10)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 6)
                            
                            Text("SAFETY")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.textSecondary)
                        }
                    }
                    
                    Spacer()
                }
                
                Spacer().frame(height: 14)
                
                // TIP
                if !user.profileTip.isEmpty {
                    HStack {
                        Text("\(user.profileTip)")
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                        
                        Button {
                            // action
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 12, weight: .heavy))
                                .foregroundColor(.pink)
                                .padding(6)
                        }
                        .background(Color.white)
                        .clipShape(Circle())
                    }
                    .padding()
                    .background(Color.pink)
                    .cornerRadius(12)
                .padding(.horizontal, 8)
                }
                
                // Tinder Gold Offering
                if !user.goldSubscriber {
                    ZStack {
                        Color.gray.opacity(0.15)
                        ProfileSwipePromo {
                            appState.showPurchaseScreen()
                        }
                    }
                    .padding(.top, 18)
                .frame(height: 260)
                }
            }
            .foregroundColor(Color.black.opacity(0.75))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .background(Color.defaultBackground)
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
