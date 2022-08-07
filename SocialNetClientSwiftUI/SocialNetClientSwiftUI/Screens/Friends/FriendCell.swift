//
//  FriendCell.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - FriendCell struct

struct FriendCell: View {
    
    // MARK: - Binding properties
    
    @Binding var friendImage: UIImage
    @Binding var friendName: String
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            AvatarView(image: $friendImage)
                .frame(width: 50, height: 50)
            friendNameText
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
    
    // MARK: - UI elements
    
    private var friendNameText: some View {
        Text(friendName)
            .font(.system(size: 20))
            .fontWeight(.medium)
            .lineLimit(1)
    }
}

struct FriendsCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            FriendCell(friendImage: .constant(UIImage()),
                        friendName: .constant("Friends Name short"))
            FriendCell(friendImage: .constant(UIImage()),
                        friendName: .constant("Friends Name long Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
        }
    }
}
