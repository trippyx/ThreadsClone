//
//  ContentViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation
import Combine
import Firebase

class ContentViewModal:ObservableObject{
    @Published var userSession:FirebaseAuth.User?
    private var cancllable = Set<AnyCancellable>()
    init(){
        setUpSubscribers()
    }
    
    private func setUpSubscribers(){
        AuthService.shared.$userSession.sink {[weak self] user in
            self?.userSession = user
        }.store(in: &cancllable)
    }
    
}
