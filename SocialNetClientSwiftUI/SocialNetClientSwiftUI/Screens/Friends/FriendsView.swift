//
//  FriendsView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - FriendsView struct

struct FriendsView: View {
    
    @State private var friends = FriendViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView{
            List {
                ForEach(friends.myFriends) { friendSection in
                    Section("\(friendSection.sectionChar)") {
                        ForEach(friendSection.friends) { friend in
                            FriendCell(friendImage: .constant(UIImage()), friendName: .constant(friend.fullName))
                        }
                    }
                }
            }
            .navigationBarTitle("Friends", displayMode: .inline)
            .listStyle(PlainListStyle())
        }
        
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
