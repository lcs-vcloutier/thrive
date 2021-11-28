//
//  SurveyEndView.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-25.
//

import SwiftUI

struct SurveyEndView: View {
    
    @ObservedObject var user: User
    
    // Design the Survey End View
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text(user.name)
                Text(user.surname)
                Text("Survey Ended, Thx 4 Participating.")
            }
            .task {
                // Here you'll save the score to the CoreData User object and re-fetch it for display.
                
            }
            
            Spacer()
        }
    }
}
