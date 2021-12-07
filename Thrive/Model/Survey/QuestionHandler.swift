//
//  QuestionHandler.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-12-06.
//

import Foundation

class QuestionHandler {
    let survey = Survey()
    var qIndex: Int = 0
    var currentQuestion: Question {
        get {
            return survey.questions[qIndex]
        }
    }
    
    func nextQuestion() {
        qIndex += (qIndex >= survey.questions.count - 1) ? 0 : 1
    }
    
    func previousQuestion() {
        qIndex -= (qIndex > 0) ? 1 : 0
    }
    
    init(){}
}
