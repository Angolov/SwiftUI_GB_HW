//
//  SignUpFormView.swift
//  SocialNetClientSwiftUI
//
//  Created by Антон Головатый on 01.08.2022.
//

import SwiftUI

// MARK: - SignUp form struct

struct SignUp: View {
    
    // MARK: - Properties
    
    @State private var email = ""
    @State private var password = ""
    @State private var repeatedPassword = ""
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
                repeatPasswordField
                    .padding(.bottom, 45)
            }
            .padding()
            .background(backgroundColor)
            .clipShape(SignUpTab())
            .contentShape(SignUpTab())
            .shadow(color: .black.opacity(0.7), radius: 10, x: 5, y: 10)
            .cornerRadius(15)
            
            signUpButton
                .offset(y: 20)
                .opacity(self.formIndex == 1 ? 1 : 0)
        }
        .onTapGesture {
            self.formIndex = 1
        }
    }
    
    // MARK: - UI elements
    
    private var tabTitle: some View {
        HStack {
            Spacer()
            Text("Sign Up")
                .foregroundColor(self.formIndex == 1 ? .white : .gray )
                .font(.title)
                .fontWeight(.bold)
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
    
    private var repeatPasswordField: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Repeat password")
                .font(.system(size: 18, weight: .bold, design: .default))
                .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                .foregroundColor(.white)
            SecureField(text: $repeatedPassword) {
                Text("Enter your password again")
            }
            .padding(5)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
        }
    }
    
    private var signUpButton: some View {
        Button {
            print("Sign up pressed")
            if checkSignUp() {
                isLoggedIn.toggle()
            }
        } label: {
            Text("SIGN UP")
                .font(.system(size: 20, weight: .heavy, design: .default))
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
    
    private func checkSignUp() -> Bool {
        // Some checking for signUp credentials
        return true
    }
}

// MARK: - SignUpTab shape

struct SignUpTab: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.height / 5))
            path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height / 5))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 15))
            path.addArc(center: CGPoint(x: rect.width / 2 + 15, y: 15),
                        radius: 15,
                        startAngle: Angle(degrees: 180),
                        endAngle: Angle(degrees: 270),
                        clockwise: false)
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp(formIndex: .constant(1), isLoggedIn: .constant(false))
    }
}
