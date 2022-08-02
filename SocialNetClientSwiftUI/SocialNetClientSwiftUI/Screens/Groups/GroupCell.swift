//
//  GroupCell.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - GroupCell struct

struct GroupCell: View {
    
    // MARK: - Binding properties
    
    @Binding var groupImage: UIImage
    @Binding var groupName: String
    @Binding var groupDescription: String
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AvatarView(image: $groupImage)
                .frame(width: 70, height: 70)
            
            VStack(alignment: .leading, spacing: 5) {
                groupNameText
                groupDescriptionText
            }
            
            Spacer(minLength: 0)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
    
    // MARK: - UI elements
    
    private var groupNameText: some View {
        Text(groupName)
            .font(.system(size: 20))
            .fontWeight(.medium)
            .lineLimit(1)
    }
    
    private var groupDescriptionText: some View {
        Text(groupDescription)
            .font(.system(size: 16))
            .fontWeight(.regular)
            .foregroundColor(.gray)
            .lineLimit(3)
    }
}

struct GroupsCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GroupCell(groupImage: .constant(UIImage()),
                       groupName: .constant("Group Name"),
                       groupDescription: .constant("Group Description short version"))
            GroupCell(groupImage: .constant(UIImage()),
                       groupName: .constant("Group Name"),
                       groupDescription: .constant("Group Description long version Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."))
        }
    }
}
