//
//  CircularProfileImage.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 21/10/23.
//

import SwiftUI

struct CircularProfileImage: View {
    var body: some View {
        Image("img")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImage()
}
