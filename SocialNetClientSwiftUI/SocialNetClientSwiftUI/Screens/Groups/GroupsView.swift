//
//  GroupsView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - GroupsView struct

struct GroupsView: View {
    
    // MARK: - Body
    
    var body: some View {
        GroupCell(groupImage: .constant(UIImage()),
                  groupName: .constant("Some Group"),
                  groupDescription: .constant("Some group description"))
    }
}

struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
