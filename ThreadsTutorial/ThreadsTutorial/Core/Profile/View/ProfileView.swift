//
//  ProfileView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user : User
    var body: some View {
        ScrollView {
            VStack(spacing:20) {
                ProfileHeaderView(user: user)
                
                Button(action: {
                    
                }, label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                })
                
               UserContentListView()
               
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
