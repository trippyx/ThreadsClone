//
//  ProfileView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 16/10/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter:ProfileThreadFilter = .threads
    @Namespace var animation
    @StateObject var viewModal = ProfileViewModal()
    private var filterBarWidth:CGFloat{
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
        
    }
    
    private var currentUser:User?{
        return viewModal.currentUser
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:20) {
                    HStack(alignment:.top) {
                        VStack(alignment:.leading,spacing: 12) {
                            VStack(alignment:.leading,spacing: 4,content: {
                                Text(currentUser?.fullName ?? "Spide man")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                
                                Text(currentUser?.userName ?? "peter.parker")
                                    .font(.subheadline)
                                
                            })
                            
                            if let bio = currentUser?.bio{
                                
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
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 352, height: 32)
                            .background(.black)
                            .cornerRadius(8)
                    })
                    
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
                    }
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    }

                }
            })
            .padding(.horizontal)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    ProfileView()
}
