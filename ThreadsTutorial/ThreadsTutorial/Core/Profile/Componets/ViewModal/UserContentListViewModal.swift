//
//  UserContentListViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation

class UserContentListViewModal:ObservableObject{
    @Published var threads = [Thread]()
    
    let user:User
    
    
    init(user:User){
        self.user = user
        Task {
           try await fetchUserThreads()
        }
    }
    
    @MainActor
    func fetchUserThreads() async throws{
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0..<threads.count{
            threads[i].user = user
        }
        
        self.threads = threads
    }
    
}
