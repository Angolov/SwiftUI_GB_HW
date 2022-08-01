//
//  LoginView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 29.07.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        
        ZStack{
            
            Color.blue
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                    .frame(maxHeight: 100)
                
                
                Text("Social Net Client")
                    .padding()
                    .font(Font.system(size: 36, weight: .heavy, design: .rounded))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    .foregroundColor(.white)
                
                Spacer()
                    .frame(maxHeight: 150)
                
                HStack {
                    Text("Email: ")
                        .frame(width: 100, alignment: Alignment.trailing)
                        .padding(5)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .foregroundColor(.white)
                    TextField(text: $email) {
                        Text("Enter your email address")
                    }
                        .frame(width: 250, height: 26)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                }
                .padding(10)
                .padding(.trailing, 10)
                .padding(.leading, 10)
                
                HStack {
                    Text("Password: ")
                        .frame(width: 100, alignment: Alignment.trailing)
                        .padding(5)
                        .font(.system(size: 18, weight: .bold, design: .default))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                        .foregroundColor(.white)
                    SecureField(text: $password) {
                        Text("Enter your password")
                    }
                        .frame(width: 250, height: 26)
                        .padding(5)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                }
                .padding(10)
                .padding(.trailing, 10)
                .padding(.leading, 10)
                
                HStack{
                    Spacer()
                    
                    Button {
                        print("Forgot password pressed")
                    } label: {
                        Text("Forgot password?")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .regular, design: .default))
                    }
                    .padding(.trailing, 20)
                }
                
                Spacer()
                    .frame(maxHeight: 50)
                
                Button {
                    print("Login pressed")
                } label: {
                    Text("Login")
                        .font(.system(size: 20, weight: .heavy, design: .default))
                }
                .frame(width: 100, height: 42)
                .foregroundColor(.white)
                .background(Color.green)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)

                Spacer()
                    .frame(minHeight: 100)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .previewInterfaceOrientation(.portrait)
    }
}
