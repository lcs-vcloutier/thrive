//
//  ThriveApp.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

@main
struct iOSApp: App {
    
    var userViewModel = UserViewModel()
    
    var body: some Scene {
        WindowGroup {
            SceneManager(userViewModel: userViewModel)
        }
    }
}
 

