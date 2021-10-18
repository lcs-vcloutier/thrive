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
        VStack{
            // This will handle user notificaiton
            // Tutorial at link: https://www.youtube.com/watch?v=ERy8RnYUKjI
            // No idea how to make this process automatic
            // IMPORTANT: the user had to click on this button for the notification to work
            // The idea is to schedule a year worth of notification all at once. I think there is a better way of doing it, but I can't be bothered. I don't think anyone will be using this app for more than a year anyway.
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
                    if(success){
                        print("Setting up notification")
                    }else{
                        print("GG")
                    }
                    
                }
                
            }
            Button("Schedule Notification")
            {
                setUpNoification()
            }
            
            Text("Hello, world!")
            // Explain what the app's about
            // define thrive/jack chapter
            // shoutout developers
        }
    }
    
    // This funciton will schedule a year worth of notificaiton.
    // Note: the varaiable motivationalQuotes could be found in the file notification Handler!
    func setUpNoification() {
        
        for i in 1...365{
            let content = UNMutableNotificationContent()
            content.title = "Motivational Quote of The Day"
            content.subtitle = movtivationalQuotes[Int.random(in:0..<movtivationalQuotes.count)]
            
            
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(24 * 60 * i), repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
