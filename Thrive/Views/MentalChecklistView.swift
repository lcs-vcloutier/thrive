//
//  MentalChecklist.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

struct MentalChecklistView: View {
    
    // Environment Object
    @Environment(\.managedObjectContext) private var viewContext
    
    // Core Data User Object
    @State var user: User
    
    // Survey Structure
    let survey = Survey()
    
    // Progression Variables
    @State var qIndex: Int = 0
    @State var surveyEnded: Bool
    
    // Compares the days and if different, returns falase
    
    static func returnSurveyEnded(_ comparedDate: Date?) -> Bool {
        if comparedDate == nil {
            return false
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: comparedDate!, to: Date.now)
        return components.day == 0
    }
    
    func updateUser() {
        user.dayStreak += 1
        // Increment of .25 with each day (beginning 1x and max 3x)
        let effectiveStreak = (user.dayStreak - 2 > 0) ? user.dayStreak : 0
        let multiplier = 1 + Int(0.25 * Double(effectiveStreak))
        let clamped = (multiplier > 3) ? 3 : multiplier
        user.totalScore += Int32(100 * clamped)
        // Change the last test date to now
        user.lastTestDate = Date.now

        // Save Context
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // Iterating to the next stage
    func iterateToNextQuestion() {
        if (qIndex < survey.questions.count - 1) {
            qIndex += 1
        } else {
            // You'll end the survey here and save user data
            self.updateUser()
            
            // Debug
            //print(user.dayStreak)
            //print(user.totalScore)
            //print(user.lastTestDate!)
            
            surveyEnded = true
        }
    }
    
    // Initializer - Compare dates to decide if survey has ended
    init (user: User) {
        self.user = user
        self.surveyEnded = MentalChecklistView.returnSurveyEnded(user.lastTestDate)
    }
    
    // View
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                Spacer()
                
                if (!surveyEnded) {
                    QuestionView(callback: self.iterateToNextQuestion, displayQuestion: survey.questions[qIndex])
                } else {
                    SurveyEndView(user: user)
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}
// Button calculates and saves a score to user defaults - appends it to an array.
// When you call it you'll use the key and display the array
