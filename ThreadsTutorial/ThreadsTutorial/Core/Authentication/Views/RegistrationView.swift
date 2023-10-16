//
//  RegistrationView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 15/10/23.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    @State private var fullName:String = ""
    @State private var userName:String = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack{
            Spacer()
            Image("thread-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            VStack(content: {
                
                TextField("Enter your email", text: $email)
                    .modifier(ThreadTextFieldModifier())
                
                
                SecureField("Enter your password", text: $password)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your full name", text: $fullName)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your username", text: $userName)
                    .modifier(ThreadTextFieldModifier())
                
            })
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(.black)
                    .cornerRadius(8)
            })
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing:3,content: {
                    Text("Already have a account ?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                })
                .foregroundStyle(.black)
                .font(.footnote)
            })
            .padding(.vertical,16)
        }
    }
}

#Preview {
    RegistrationView()
}
