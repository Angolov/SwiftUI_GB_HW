//
//  AuthorizationView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 29.07.2022.
//

import SwiftUI

// MARK: - AuthorizationView struct

struct AuthorizationView: View {
    
    // MARK: - Properties
    
    @State private var formIndex = 0
    @Binding var isLoggedIn: Bool
    
    // MARK: - Body
    
    var body: some View {
        VStack() {
            Spacer()
            
            title
            
            Spacer()
            
            ZStack {
                SignUp(formIndex: $formIndex, isLoggedIn: $isLoggedIn)
                    .zIndex(Double(self.formIndex))
                Login(formIndex: $formIndex, isLoggedIn: $isLoggedIn)
            }
            Spacer()
        }
        .padding()
        .background(backgroundColorGradient.edgesIgnoringSafeArea(.all))
    }
    
    // MARK: - UI elements
    
    private var title: some View {
        Text("Social Net Client")
            .font(.system(size: 36, weight: .heavy, design: .rounded))
            .multilineTextAlignment(.center)
            .padding()
            .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            .foregroundColor(.white)
    }
    
    private var backgroundColorGradient: LinearGradient {
        
        let firstColor = Color(#colorLiteral(red: 0.1862929761, green: 0.4510598779, blue: 0.9292573333, alpha: 1))
        let secondColor = Color(#colorLiteral(red: 0.7729142308, green: 0.4290017486, blue: 1, alpha: 1))
        let thirdColor = Color(#colorLiteral(red: 0.07064913958, green: 0.07821754366, blue: 0.746175468, alpha: 1))
        
        return LinearGradient(colors: [firstColor, secondColor, thirdColor],
                              startPoint: .top,
                              endPoint: .bottom)
    }
}

struct MainLoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView(isLoggedIn: .constant(false))
    }
}



