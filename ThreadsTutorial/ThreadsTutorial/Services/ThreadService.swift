//
//  ThreadService.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct ThreadService{
    static func uploadThread(_ thread:Thread) async throws{
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
        
    }
    
    static func fetchThreads() async throws -> [Thread]{
        let snapshot = try await Firestore.firestore().collection("threads").order(by: "timeStamp",descending: true).getDocuments()
        
        return snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        
    }
    
    
    static func fetchUserThreads(uid:String) async throws -> [Thread]{
        let snapshot = try await Firestore.firestore().collection("threads").whereField("ownerUid", isEqualTo:uid).getDocuments()
        
        let threads = snapshot.documents.compactMap({ try? $0.data(as: Thread.self)})
        return threads.sorted(by: {$0.timeStamp.dateValue() > $1.timeStamp.dateValue() })
    }
    
}
