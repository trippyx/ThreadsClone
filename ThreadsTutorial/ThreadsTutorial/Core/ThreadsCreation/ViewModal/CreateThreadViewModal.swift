//
//  CreateThreadViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation
import Firebase
class CreateThreadViewModal:ObservableObject{
    
    func uploadThread(caption:String) async throws{
        
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timeStamp: Timestamp(), likes: 0)
        
        try await ThreadService.uploadThread(thread)
    }
    
}
