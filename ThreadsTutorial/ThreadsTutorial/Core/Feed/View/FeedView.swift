//
//  FeedView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModal = FeedViewModal()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(viewModal.threads,id:\.id){ thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModal.fetchThreads()
                }
              
            }
            
            .scrollIndicators(.never)
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.black)
                    })
                }
            })
           
        }
    }
}

#Preview {
    FeedView()
}
