//
//  FeedView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(0...10,id:\.self){ thread in
                       ThreadCell()
                    }
                }
            }
            .refreshable {
                print("Refresh")
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
