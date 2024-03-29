//
//  ThreadCell.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 18/10/23.
//

import SwiftUI

struct ThreadCell: View {
    let thread:Thread
    var body: some View {
        VStack {
            HStack(alignment: .top,spacing: 12, content: {
                CircularProfileImage(user: thread.user, size: .medium)
                
                VStack(alignment:.leading,content: {
                    HStack(content: {
                        Text(thread.user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        })
                        
                    })
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing:16,content: {
                        Button(action: {}, label: {
                            Image(systemName: "heart")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "bubble.right")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "arrow.rectanglepath")
                        })
                        
                        Button(action: {}, label: {
                            Image(systemName: "paperplane")
                        })
                    })
                    .foregroundStyle(.black)
                    .padding(.vertical,8)
                    
                    Divider()
                })
               
            })
            .padding()
            
        }
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
