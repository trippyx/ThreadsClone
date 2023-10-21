//
//  EditProfileView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 22/10/23.
//

import SwiftUI

struct EditProfileView: View {
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
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
                            
                            Text("Spider Man")
                                
                        })
                        Spacer()
                        CircularProfileImage()
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
                        
                    }, label: {
                       Text("Cancel")
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            
                    })
                    
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
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
    EditProfileView()
}
