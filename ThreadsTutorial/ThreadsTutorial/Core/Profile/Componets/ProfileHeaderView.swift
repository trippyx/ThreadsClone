//
//  ProfileHeaderView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user:User?
    var body: some View {
        HStack(alignment:.top) {
            VStack(alignment:.leading,spacing: 12) {
                VStack(alignment:.leading,spacing: 4,content: {
                    Text(user?.fullName ?? "Peter Parker")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.userName ?? "Spiderman")
                        .font(.subheadline)
                    
                })
                
                if let bio = user?.bio{
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImage()
        }
    }
}

#Preview {
    ProfileHeaderView(user:DeveloperPreview.shared.user)
}
