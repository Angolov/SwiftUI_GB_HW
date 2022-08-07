//
//  MainTabBar.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 01.08.2022.
//

import SwiftUI

// MARK: - MainTabSelection enum

enum MainTabSelection: Int {
    case friends
    case groups
    case news
}

// MARK: - MainTabBar struct

struct MainTabBar: View {
    
    // MARK: - Properties
    
    @State private var selectedScreen = MainTabSelection.friends.rawValue
    
    // MARK: - Body
    
    var body: some View {
        TabView(selection: $selectedScreen) {
            
            FriendsView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("My Friends")
                }
                .tag(MainTabSelection.friends.rawValue)
            
            GroupsView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("My Groups")
                }
                .tag(MainTabSelection.groups.rawValue)
            
            NewsView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("My News")
                }
                .tag(MainTabSelection.news.rawValue)
        }
        .font(.headline)
    }
}

struct MainTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabBar()
    }
}
