//
//  ContentView.swift
//  ThreadsTutorial
//
//  Created by Kuldeep Singh on 15/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModal = ContentViewModal()
    var body: some View {
        Group {
            if viewModal.userSession != nil{
                ThreadsTabView()
            }else{
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
