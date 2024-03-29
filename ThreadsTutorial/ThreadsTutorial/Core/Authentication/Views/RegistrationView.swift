//
//  RegistrationView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 15/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModal = RegistrationViewModal()
    
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
                
                TextField("Enter your email", text:$viewModal.email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadTextFieldModifier())
                
                
                SecureField("Enter your password", text: $viewModal.password)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your full name", text: $viewModal.fullName)
                    .modifier(ThreadTextFieldModifier())
                
                TextField("Enter your username", text: $viewModal.userName)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadTextFieldModifier())
                
                
            })
            
            Button(action: {
                Task {
                    try await viewModal.createUser()
                }
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
