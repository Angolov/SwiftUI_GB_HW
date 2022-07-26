//
//  FriendCell.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - FriendCell struct

struct FriendCell: View {
    
    // MARK: - State properties
    
    @State var friendImage: UIImage
    @State var friendName: String
    
    // MARK: Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 15) {
            AvatarView(image: friendImage)
                .frame(width: 40, height: 40)
            friendNameText
            Spacer(minLength: 0)
        }
        .padding(.vertical, 3)
    }
    
    // MARK: - UI elements
    
    private var friendNameText: some View {
        Text(friendName)
            .font(.system(size: 16))
            .fontWeight(.medium)
            .lineLimit(1)
    }
}

struct FriendsCell_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            FriendCell(friendImage: UIImage(),
                        friendName: "Friends Name short")
            FriendCell(friendImage: UIImage(),
                        friendName: "Friends Name long Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        }
    }
}
