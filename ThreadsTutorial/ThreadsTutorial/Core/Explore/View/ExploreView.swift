//
//  ExploreView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModal = ExploreViewModal()
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack{
                    ForEach(viewModal.users,id:\.id) { user in
                        NavigationLink(value: user) {
                            VStack {
                                UserCell(user:user)
                                Divider()
                            }
                            .padding(.vertical,4)
                        }
                    }
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user:user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText,prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
