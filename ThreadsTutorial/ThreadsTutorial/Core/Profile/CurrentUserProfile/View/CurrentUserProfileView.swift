//
//  CurrentUserProfileView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import SwiftUI
import _PhotosUI_SwiftUI

struct CurrentUserProfileView: View {
   
    @StateObject var viewModal = CurrentUserProfileViewModal()
    @State private var showEditProfile = false
    
    private var currentUser:User?{
        return viewModal.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing:20) {
                    
                   ProfileHeaderView(user: currentUser)
                    
                    Button(action: {
                        withAnimation(.bouncy) {
                            showEditProfile.toggle()
                        }
                       
                    }, label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4),lineWidth:1)
                            }
                    })
                    
                    UserContentListView(user: currentUser ?? DeveloperPreview.shared.user)
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                
                if let user = currentUser{
                    EditProfileView(user: user)
                }
               
            })
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
    CurrentUserProfileView()
}
