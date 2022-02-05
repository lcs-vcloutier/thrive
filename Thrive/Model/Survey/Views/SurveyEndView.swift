//
//  SurveyEndView.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-25.
//

import SwiftUI

struct SurveyEndView: View {
    
    var user: UserViewModel
    
    // Design the Survey End View
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Text(user.user!.name)
                Text(user.user!.surname)
                Text("\(user.user!.dayStreak)")
                Text("Survey Ended, Thx 4 Participating.")
            }
            
            Spacer()
        }
    }
}
