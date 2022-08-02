//
//  PhotoGalleryView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 02.08.2022.
//

import SwiftUI

// MARK: - PhotoGalleryView struct

struct PhotoGalleryView: View {
    
    // MARK: - Properties
    
    @Binding var columnsCount: Double
    let spacing: CGFloat = 5
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { proxy in
            
            let columnsInt = Int(columnsCount)
            let gridColumns = Array(repeating: GridItem(.flexible(), spacing: spacing * 2), count: columnsInt)
            let imageSize = proxy.size.width / CGFloat(columnsInt)
            
            ScrollView{
                LazyVGrid(columns: gridColumns, spacing: spacing) {
                    ForEach(0..<100) { num in
                        Image("photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: imageSize, height: imageSize)
                            .clipped()
                    }
                }
            }
        }
    }
}

struct PhotoGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGalleryView(columnsCount: .constant(3))
    }
}
