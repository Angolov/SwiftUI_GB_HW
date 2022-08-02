//
//  FriendGalleryView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - FriendGalleryView struct

struct FriendGalleryView: View {
    
    // MARK: - Properties
    
    @State private var columnsCount: Double = 3
    @GestureState private var pinchGesture: CGFloat = 1
    
    var friend: FriendModel
    
    // MARK: - Body
    
    var body: some View {
        
        PhotoGalleryView(columnsCount: $columnsCount)
            .gesture(
                MagnificationGesture()
                    .updating($pinchGesture, body: { value, state, _ in
                        state = value
                    })
                    .onChanged({ value in
                        if value > 1 {
                            increaseColumns()
                        } else {
                            decreaseColumns()
                        }
                    })
            )
            .navigationBarTitle("\(friend.fullName)", displayMode: .inline)
    }
    
    // MARK: - Private methods
    
    private func increaseColumns() {
        if columnsCount < 10 {
            columnsCount += 0.1
        }
    }
    
    private func decreaseColumns() {
        if columnsCount > 1.1 {
            columnsCount -= 0.1
        }
    }
}

struct FriendGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        FriendGalleryView(friend: FriendModel(firstName: "Name", familyName: "Family Name", imageUrlString: ""))
    }
}
