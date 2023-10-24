//
//  FeedViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation

@MainActor
class FeedViewModal:ObservableObject{
    @Published var threads = [Thread]()
    
    init() {
        Task {
            try await fetchThreads()
        }
    }
    
    
    func fetchThreads() async throws{
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }
    
    
    private func fetchUserDataForThreads() async throws{
        for i in 0..<threads.count {
            let thread = threads[i]
            let onwerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: onwerUid)
            
            threads[i].user = threadUser
            
        }
    }
}
