//
//  ContentView.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            
            // TO DO: Explain what the app's about
            // TO DO: Explain THRIVE
            // TO DO: Explain Developers
            Button("Would you like to receive motivational quotes everyday?", action: setUpNotification)
            
        }
        .task {
            askUserNotificationPermission()
        }
    }
}
