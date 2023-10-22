//
//  LoginViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation


class LoginViewModal:ObservableObject{
    
    @Published var email:String = ""
    @Published var password:String = ""
   
    
    
    @MainActor
    func login() async throws{
       try? await AuthService.shared.login(withEmail: email, password: password)
    }
}
