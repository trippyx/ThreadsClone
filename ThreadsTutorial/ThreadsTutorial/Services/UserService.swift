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
            
            
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
    static func fetchUsers() async throws -> [User]{
        guard let currentUserUid = Auth.auth().currentUser?.uid else { return []}
        let snapShot = try await Firestore.firestore().collection("users").getDocuments()
        let users = snapShot.documents.compactMap({try? $0.data(as: User.self)})
        
        return users.filter({$0.id != currentUserUid})
    }
    
    func resetUser(){
        self.currentUser = nil
    }
    
    
}
