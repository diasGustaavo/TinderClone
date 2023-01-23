//
//  MainView.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var appState: AppStateManager
    
    func correctViewForState() -> some View {
        switch appState.selectedTab {
        case .fire:
            let view = Text("Fire")
            return AnyView(view)
        case .star:
            let view = Text("star")
            return AnyView(view)
        case .message:
            let view = Text("message")
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .opacity(0.35)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                HStack {
                    Spacer()
                    
                    TabBarButtonView(type: .fire)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .star)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .message)
                    
                    Spacer()
                    
                    TabBarButtonView(type: .profile)
                    
                    Spacer()
                }
                .frame(height: 100)
                
                correctViewForState()
                
                Spacer()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
