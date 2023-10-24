//
//  EditProfileViewModal.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 24/10/23.
//

import Foundation
import SwiftUI
import _PhotosUI_SwiftUI


class EditProfileViewModal:ObservableObject{
    @Published var selectedItem:PhotosPickerItem?{
        didSet{
            Task {
                 await loadImage()
            }
        }
    }
    @Published var profileImage: Image?
    private var uiimage:UIImage?
    
    
    func updateUserData() async throws{
        try await updateProfileImage()
    }
    
    @MainActor
    private func loadImage() async{
        guard let item = selectedItem else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiimage = UIImage(data: data) else { return }
        self.uiimage = uiimage
        self.profileImage = Image(uiImage: uiimage)
        
        
    }
    
    private func updateProfileImage() async throws{
        guard let image = self.uiimage else { return }
        guard let imageUrl = try? await ImageUploader.uploadImage(image) else { return }
        try await UserService.shared.updateUserProfileImage(withImageUrl: imageUrl)
    }
    
}
