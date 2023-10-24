//
//  Thread.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift


struct Thread:Identifiable,Codable{
    @DocumentID var threadId:String?
    var id:String {
        return threadId ?? NSUUID().uuidString
    }
    let ownerUid:String
    let caption:String
    let timeStamp:Timestamp
    var likes:Int
    var user:User?
    
    
}
