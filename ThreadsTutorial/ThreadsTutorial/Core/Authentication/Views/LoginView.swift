//
//  LoginView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 15/10/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email:String = ""
    @State private var password:String = ""
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("thread-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .padding()
                
                VStack(content: {
                    
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.none)
                        .modifier(ThreadTextFieldModifier())
                    
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadTextFieldModifier())
                    
                })
                
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password ?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing,28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    
                }
                
                
                Button(action: {
                    
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                })
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing:3,content: {
                        Text("Don't have a account ?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    })
                    .foregroundStyle(.black)
                    .font(.footnote)
                }
                .padding(.vertical,16)

                
            }
        }
    }
}

#Preview {
    LoginView()
}
