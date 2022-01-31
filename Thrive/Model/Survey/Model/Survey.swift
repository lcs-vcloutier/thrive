//
//  Survey.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-25.
//

import Foundation

let surveyObjects = [
    [
        "question": "blablabla?",
        "answers": ["aaa","bbb","ccc","ddd"]
    ],
    [
        "question": "clclclclcl?",
        "answers": ["eee","fff","ggg","hhh"]
    ]
]

struct Question: Identifiable {
    
    var id: ObjectIdentifier
    var question: String
    var answers: [String]
}

struct Survey {
    var questions: [Question]
    
    init () {
        var questionObjects: [Question] = []
        
        for obj in surveyObjects {
            questionObjects.append(Question(id: ObjectIdentifier.init(Int.self), question: obj["question"] as! String, answers: obj["answers"] as! [String]))
        }
        self.questions = questionObjects
    }
}
