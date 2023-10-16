//
//  ThreadTextFieldModifier.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 15/10/23.
//

import Foundation
import SwiftUI

struct ThreadTextFieldModifier:ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal,24)
    }
    
    
}
