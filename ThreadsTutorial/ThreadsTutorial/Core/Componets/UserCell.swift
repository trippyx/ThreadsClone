//
//  UserCell.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 21/10/23.
//

import SwiftUI

struct UserCell: View {
    let user:User
    var body: some View {
        HStack(content: {
            CircularProfileImage(user: user, size: .small)
            
            VStack(alignment: .leading, content: {
                Text(user.userName)
                    .fontWeight(.semibold)
                Text(user.fullName)
                   
                
            })
            .font(.footnote)
           
           Spacer()
           
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4),lineWidth:1)
                }
            
        })
        .padding(.horizontal)
    }
}

#Preview {
    UserCell(user: DeveloperPreview.shared.user)
}
