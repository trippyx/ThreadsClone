//
//  EditProfileView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user : User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModal = EditProfileViewModal() 
   
    
    
    var body: some View {
        NavigationStack {
            ZStack(content: {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom,.horizontal])
                
                VStack {
                    //Name and Profile
                    HStack(content: {
                        VStack(alignment:.leading,content: {
                            
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullName)
                                
                        })
                        Spacer()
//                        CircularProfileImage()
                        PhotosPicker(selection: $viewModal.selectedItem) {
                            if let image = viewModal.profileImage{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            }else{
                                CircularProfileImage(user: user, size: .medium)
                            }
                        }
                    })
                    
                    Divider()
                    
                    //Bio
                    
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio", text: $bio,axis: .vertical)
                    }
                    
                    
                    Divider()
                    
                    //Link
                    
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add here", text: $link,axis: .vertical)
                    }
                   
                    
                    Divider()
                    
                    Toggle("Private Profile", isOn: $isPrivateProfile)
                    
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                })
                .padding()
               
                
            })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                       Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            
                    })
                    
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        Task {
                            try await viewModal.updateUserData()
                            dismiss()
                        }
                    }, label: {
                       Text("Done")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                           
                    })
                    
                }
            })
            
        }
        
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
