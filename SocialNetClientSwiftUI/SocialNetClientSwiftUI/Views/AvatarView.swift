//
//  AvatarView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

struct AvatarView: View {
    @Binding var image: UIImage
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .background(Color.green)
            .clipShape(Circle())
            .contentShape(Circle())
            .overlay(Circle().strokeBorder(Color.white, lineWidth: 2))
            .shadow(color: .black.opacity(0.3), radius: 5, x: 3, y: 3)
    }
}


struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(image: .constant(UIImage()))
    }
}
