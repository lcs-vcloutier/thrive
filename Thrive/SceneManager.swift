//
//  SceneManager.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI
import CoreData

struct SceneManager: View {
    
    let userViewModel: UserViewModel
    
    var body: some View {
        ZStack {
            if userViewModel.user != nil {
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
                //UserCreationPopOut(userMutating: $user)
            }
            else {
                UserCreationPopOut(user: userViewModel)
            }
        }
        // Runs when the view first appears
        .task {
            userViewModel.fetchUser()
        }
    }
}
