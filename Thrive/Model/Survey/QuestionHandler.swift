//
//  QuestionHandler.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-12-06.
//

import Foundation

class QuestionHandler {
    // User Object to Mutate
    var user: UserViewModel
    
    // Survey for Questions
    private let survey = Survey()
    
    // Index value to iterate
    private var qIndex: Int = 0
    
    // Computed Value of Question
    var currentQuestion: Question? {
        get {
            return (!surveyShouldEnd) ? survey.questions[qIndex] : nil
        }
    }
    
    private var surveyShouldEnd: Bool
    
    // Is the first question
    var isFirst: Bool {
        get {
            return qIndex == 0
        }
    }
    // Is the last question
    var isLast: Bool {
        get {
            return qIndex == survey.questions.count - 1
        }
    }
    
    // Check Survey Should End
    static func returnSurveyEnded(_ comparedDate: Date?) -> Bool {
        if comparedDate == nil {
            return false
        }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: comparedDate!, to: Date.now)
        return components.day == 0
    }
    
    // Iterate to next question
    private func nextIndex() {
        qIndex += (self.isLast) ? 0 : 1
    }
    
    // Iterate to previous question
    private func previousIndex() {
        qIndex -= (self.isFirst) ? 0 : 1
    }
    
    func toIndex(_ index: Int) throws {
        if index >= survey.questions.count || index < 0 {
            throw SpecialErrors.IndexRange
        }
        qIndex = index
    }
    
    // Switching Questions w/ Check
    func nextQuestion() {
        if (!self.isLast) {
            self.nextIndex()
        } else {
            self.surveyShouldEnd = true
            self.user.updateUser()
        }
    }
    
    func previousQuestion() {
        if (!self.isFirst) {
            self.previousIndex()
        }
    }
    
    init(user: UserViewModel) {
        self.user = user
        self.surveyShouldEnd = QuestionHandler.returnSurveyEnded(user.user?.lastTestDate)
    }
}
// Create a class for handling user object
