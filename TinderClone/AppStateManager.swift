//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Gustavo Dias on 23/01/23.
//

import Foundation

class AppStateManager: ObservableObject {
    @Published var selectedTab: TabBarButtonType = .fire
}
