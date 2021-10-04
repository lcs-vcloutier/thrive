//
//  ThriveApp.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

@main
struct iOSApp: App {

    
    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ContentView()
                }
                .tabItem {
                    Image(systemName: "house.fill")
                    Text ("About")
                    
                }
                
                NavigationView {
                    Resources()
                }
                .tabItem {
                    Image(systemName: "info.circle.fill")
                    Text ("Resources")
                }
                
                NavigationView {
                    MentalChecklist()
                }
                .tabItem {
                    Image(systemName: "checklist")
                    Text ("Checklist")
                }
            }
        }
    }
}
 

