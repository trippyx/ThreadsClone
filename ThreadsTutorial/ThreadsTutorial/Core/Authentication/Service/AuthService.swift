//
//  AuthService.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService{
    
    static let shared = AuthService()
    @Published var userSession: FirebaseAuth.User?
    
    
    init() {
        userSession = Auth.auth().currentUser
    }
    
    
    @MainActor
    func login(withEmail: String,password:String) async throws{
        do{
            let result = try await Auth.auth().signIn(withEmail: withEmail, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        }catch{
            print("Something went wrong \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail:String,password:String,fullName:String,userName:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: withEmail, password: password)
            self.userSession = result.user
            
            try await uploadUserData(withEmail: withEmail, password: password, fullName: fullName, userName: userName, id: result.user.uid)
            
            print("User id \(result.user.uid)")
        }catch{
            print("Something went wrong \(error.localizedDescription)")
        }
    }
    
    private func uploadUserData(withEmail:String,password:String,fullName:String,userName:String,id:String) async throws{
        let user = User(id: id, fullName: fullName, email: withEmail, userName: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
        
    }
    
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.resetUser()
    }
    
}
