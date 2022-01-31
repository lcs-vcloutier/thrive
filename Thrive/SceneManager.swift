//
//  SceneManager.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI
import CoreData

struct SceneManager: View {
    
    @ObservedObject var userViewModel: UserViewModel
    
    // To control the pop-out view
    @State var showingCreateUser: Bool = false
    
    var body: some View {
        ZStack {
            TabView {
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text ("About")
                    
                }
                
                NavigationView {
                    MentalChecklistView(user: userViewModel)
                }
                .tabItem {
                    Image(systemName: "checklist")
                    Text ("Checklist")
                }
            }
            .ignoresSafeArea()
        }
        // Runs when the view first appears
        .task {
            userViewModel.fetchUser()
            showingCreateUser = (userViewModel.user == nil)
        }
        .sheet(isPresented: $showingCreateUser) {
            UserCreationPopOut(user: userViewModel, showing: $showingCreateUser)
        }
    }
}
