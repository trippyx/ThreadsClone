//
//  ThreadsTabView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct ThreadsTabView: View {
    @State var selectedTab = 0
    var body: some View {
        
        TabView(selection:$selectedTab) {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 0
                })
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear(perform: {
                    selectedTab = 1
                })
                .tag(1)
            
            
            
            CreateThreadView()
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear(perform: {
                    selectedTab = 2
                })
                .tag(2)
            
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 3
                })
                .tag(3)
            
            
            ProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear(perform: {
                    selectedTab = 4
                })
                .tag(4)
            
        }
        .tint(.black)
    }
}

#Preview {
    ThreadsTabView()
}
