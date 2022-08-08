//
//  LoginFormView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 01.08.2022.
//

import SwiftUI

// MARK: - Login form struct

struct Login: View {
    
    // MARK: - Properties
    
    @State private var email = ""
    @State private var password = ""
    @State private var showEmptyFieldsAlert = false
    @State private var showLoginAlert = false
    
    @Binding var formIndex: Int
    @Binding var isLoggedIn: Bool
    
    // MARK: - Body
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 15) {
                tabTitle
                emailField
                    .padding(.top, 10)
                passwordField
                forgotPassButton
                    .padding(.bottom, 68)
            }
            .padding()
            .background(backgroundColor)
            .clipShape(LoginTab())
            .contentShape(LoginTab())
            .cornerRadius(15)
            .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 10)
            
            loginButton
                .offset(y: 20)
                .opacity(self.formIndex == 0 ? 1 : 0)
                .alert("Error", isPresented: $showEmptyFieldsAlert, actions: {
                    
                }, message: {
                    Text("Email or password cannot be empty. Please try again.")
                })
                .alert("Error", isPresented: $showLoginAlert, actions: {
                    
                }, message: {
                    Text("Email or password is not correct. Please try again.")
                })
        }
        .onTapGesture {
            self.formIndex = 0
        }
    }
    
    // MARK: - UI elements
    
    private var tabTitle: some View {
        HStack {
            Text("Log in")
                .foregroundColor(self.formIndex == 0 ? .white : .gray )
                .font(.title)
                .fontWeight(.bold)
            Spacer()
        }
    }
    
    private var emailField: some View {
        VStack(alignment: .leading, spacing: 10){
            Text("Email")
                .frame(alignment: .leading)
                .padding(5)
                .font(.system(size: 18, weight: .bold, design: .default))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                .foregroundColor(.white)
            
            TextField(text: $email) {
                Text("Enter your email address")
            }
            .keyboardType(.emailAddress)
            .padding(5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
        }
    }
    
    private var passwordField: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Password")
                .font(.system(size: 18, weight: .bold, design: .default))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                .foregroundColor(.white)
            SecureField(text: $password) {
                Text("Enter your password")
            }
            .padding(5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
        }
    }
    
    private var forgotPassButton: some View {
        HStack{
            Spacer()
            
            Button {
                print("Forgot password pressed")
            } label: {
                Text("Forgot password?")
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .regular, design: .default))
            }
        }
        .padding(10)
    }
    
    private var loginButton: some View {
        Button {
            if areCredentialsCorrect() {
                withAnimation {
                    isLoggedIn = true
                }
            }
        } label: {
            Text("LOG IN")
                .font(.system(size: 20))
                .fontWeight(.heavy)
        }
        .frame(width: 100, height: 42)
        .foregroundColor(.white)
        .background(Color.green)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
    }
    
    private var backgroundColor: Color {
        let color = Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1))
        return color
    }
    
    // MARK: - Private methods
    
    private func areCredentialsCorrect() -> Bool {
        guard isEmailOrPassFieldEmpty() else { return false }
        
        if email == "admin@yandex.ru",
           password == "12345" {
            return true
        }
        
        showLoginAlert = true
        return false
    }
    
    private func isEmailOrPassFieldEmpty() -> Bool {
        if email == "" || password == "" {
            showEmptyFieldsAlert = true
            return false
        }
        
        return true
    }
}

// MARK: - LoginTab shape

struct LoginTab: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2 - 15, y: 0))
            path.addArc(center: CGPoint(x: rect.width / 2 - 15, y: 15),
                        radius: 15,
                        startAngle: Angle(degrees: 270),
                        endAngle: Angle(degrees: 360),
                        clockwise: false)
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height / 5))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height / 5))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login(formIndex: .constant(0), isLoggedIn: .constant(false))
    }
}
