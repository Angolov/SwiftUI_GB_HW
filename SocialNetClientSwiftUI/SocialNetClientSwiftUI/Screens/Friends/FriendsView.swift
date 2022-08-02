//
//  FriendsView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - FriendsView struct

struct FriendsView: View {
    
    // MARK: - Body
    
    var body: some View {
        FriendCell(friendImage: .constant(UIImage()), friendName: .constant("Some Friend"))
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
