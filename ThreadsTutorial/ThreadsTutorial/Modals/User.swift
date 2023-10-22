//
//  User.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import Foundation

struct User:Identifiable,Codable,Hashable{
    let id:String
    let fullName:String
    let email:String
    let userName:String
    var profileImageUrl:String? = nil
    var bio:String? = nil
}
