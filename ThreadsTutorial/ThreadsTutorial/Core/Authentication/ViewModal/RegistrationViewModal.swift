//
//  RegistrationViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation

class RegistrationViewModal:ObservableObject{
    
    @Published var email:String = ""
    @Published var password:String = ""
    @Published var fullName:String = ""
    @Published var userName:String = ""
    
    
    @MainActor
    func createUser() async throws{
       try? await AuthService.shared.createUser(withEmail: email, password: password, fullName: fullName, userName: userName)
    }
}
