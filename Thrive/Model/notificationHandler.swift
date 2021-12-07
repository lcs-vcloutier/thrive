//
//  NotificationHandler.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import Foundation
import UserNotifications

// Tutorial at link: https://www.youtube.com/watch?v=ERy8RnYUKjI
// IMPORTANT: The user has to click on this button for the notification to work

// Array of quotes to send through notification everyday
let motivationalQuotes : [String] = ["Quote #1", "Quote #2", "Quote #3", "Quote #4", "Quote #5", "Quote #5"]

// This function will ask the user for permission to send notifications
func askUserNotificationPermission() {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]){ success, error in
        if (success) {
            print("Notifications Allowed")
        } else {
            print("Notifications Denied")
        }
    }
}

// This function will schedule a year's worth of notifications.
func setUpNotification() {
    for i in 1...365 {
        let content = UNMutableNotificationContent()
        content.title = "Motivational Quote of The Day"
        content.subtitle = motivationalQuotes[Int.random(in:0..<motivationalQuotes.count)]
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(24 * 60 * i), repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
