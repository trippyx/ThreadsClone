//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation
import SwiftUI
import Firebase

class DeveloperPreview{
    static let shared = DeveloperPreview()
    
    let user = User(id: UUID().uuidString, fullName: "TestData", email: "test@yopmail.com", userName: "testxyz")
    
    let thread = Thread(ownerUid: "123", caption: "Test caption", timeStamp: Timestamp(), likes: 0)
}
