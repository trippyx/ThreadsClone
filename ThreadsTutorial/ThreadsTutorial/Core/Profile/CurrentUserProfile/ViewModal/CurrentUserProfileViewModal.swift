//
//  ProfileViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation
import Combine

class CurrentUserProfileViewModal:ObservableObject{
    @Published var currentUser:User?
    
    var cancllable = Set<AnyCancellable>()
    
    init(){
        setupSubscibers()
    }
    
    private func setupSubscibers(){
        UserService.shared.$currentUser.sink {[weak self] userData in
            self?.currentUser = userData
        }.store(in: &cancllable)
    }
    
        
    
}
