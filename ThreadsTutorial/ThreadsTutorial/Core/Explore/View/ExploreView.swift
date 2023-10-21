//
//  ExploreView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(0...10,id: \.self) { i in
                        VStack {
                            UserCell()
                            Divider()
                        }
                        .padding(.vertical,4)
                    }
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText,prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
