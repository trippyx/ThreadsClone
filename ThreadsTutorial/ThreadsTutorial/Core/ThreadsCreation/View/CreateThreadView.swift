//
//  CreateThreadView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct CreateThreadView: View {
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        NavigationStack {
            VStack(content: {
                HStack(alignment: .top, spacing: 4, content: {
                    CircularProfileImage(user: nil, size: .small)
                    VStack(alignment: .leading,spacing: 4, content: {
                        Text("Spider man")
                            .fontWeight(.semibold)
                        TextField("Start a thread...", text: $caption,axis: .vertical)
                        
                    })
                    .font(.footnote)
                    Spacer()
                    
                    if !caption.isEmpty{
                        Button(action: {
                            caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(.gray)
                        })
                    }
                })
                Spacer()
                
            })
            .padding()
            .navigationTitle("New Thread")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Text("Post")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .disabled(caption.isEmpty)
                        
                    })
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                        
                    })
                }
                
            })
        }
    }
}

#Preview {
    CreateThreadView()
}
