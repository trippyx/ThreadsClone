//
//  UserService.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation
import Firebase

class UserService{
    @Published var currentUser:User?
    
    static let shared = UserService()
    
    init() {
        Task {
           try await fetchCurrentUser()
        }
    }
    
    
    @MainActor
    func fetchCurrentUser() async throws{
        
        do{
            guard let uid = Auth.auth().currentUser?.uid else { return }
            
            let snapShot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            
            let user = try snapShot.data(as: User.self)
            
            self.currentUser = user
            
            print("Current User \(currentUser)")
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    
    
    func resetUser(){
        self.currentUser = nil
    }
    
    
}
