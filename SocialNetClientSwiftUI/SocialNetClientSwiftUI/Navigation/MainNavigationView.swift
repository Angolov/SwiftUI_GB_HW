//
//  MainNavigationView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - MainNavigationView struct

struct MainNavigationView: View {
    
    // MARK: - State properties
    
    @State private var isLoggedIn = false
    
    // MARK: - Body
    
    var body: some View {
        if isLoggedIn {
            MainTabBar()
                .transition(.move(edge: .trailing))
        } else {
            AuthorizationView(isLoggedIn: $isLoggedIn)
        }
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
