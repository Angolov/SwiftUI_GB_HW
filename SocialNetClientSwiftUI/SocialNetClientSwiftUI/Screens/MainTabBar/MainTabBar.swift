//
//  MainTabBar.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 01.08.2022.
//

import SwiftUI

struct MainTabBar: View {
    @State private var isLoggedIn = false
    
    var body: some View {
        if !isLoggedIn {
            MainLoginView(isLoggedIn: $isLoggedIn)
        } else {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
