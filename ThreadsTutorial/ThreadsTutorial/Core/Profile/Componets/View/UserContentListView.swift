//
//  UserContentListView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter:ProfileThreadFilter = .threads
    @Namespace var animation
    
    @StateObject var viewModal:UserContentListViewModal
    
    var scaleEffect:CGFloat = 1.0
    private var filterBarWidth:CGFloat{
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
        
    }
    
    
    init(user : User){
        self._viewModal = StateObject(wrappedValue: UserContentListViewModal(user: user))
    }
    
    
    var body: some View {
        VStack{
            HStack(content: {
                ForEach(ProfileThreadFilter.allCases){ filter in
                    VStack(content: {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter{
                            Rectangle()
                                .foregroundStyle(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        }else{
                            Rectangle()
                                .foregroundStyle(.white)
                                .frame(width: filterBarWidth, height: 1)
                        }
                    })
                    .onTapGesture {
                        selectedFilter = filter
                    }
                }
            })
            LazyVStack(content: {
                ForEach(viewModal.threads) { thread in
                    ThreadCell(thread: thread)
                }
            })
            
        }
        .padding(.vertical,8)
    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
