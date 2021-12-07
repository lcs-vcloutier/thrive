//
//  SceneManager.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI
import CoreData

struct SceneManager: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var user: User?
    
    var body: some View {
        ZStack {
            if user != nil {
                TabView {
                    NavigationView {
                        ContentView()
                    }
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text ("About")
                        
                    }
                    
                    NavigationView {
                        MentalChecklistView(user: user!)
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
                UserCreationPopOut(userMutating: $user)
            }
        }
        // Runs when the view first appears
        .task {
            let fetchRequest : NSFetchRequest<User> = User.fetchRequest()
            
            do {
                let items = try managedObjectContext.fetch(fetchRequest)
                user = items.first
            } catch let error as NSError {
                print("Error counting users: \(error.localizedDescription)")
            }
        }
    }
}
