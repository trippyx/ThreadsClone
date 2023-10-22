//
//  ExploreViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation

class ExploreViewModal:ObservableObject{
    @Published var users = [User]()
    
    
    init(){
        Task {
           try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws{
        self.users = try await UserService.fetchUsers()
    }
}
