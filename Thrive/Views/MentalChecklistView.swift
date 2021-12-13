//
//  MentalChecklist.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

struct MentalChecklistView: View {
    
    // Core Data User Object
    var user: UserViewModel
    
    // Progression Handler
    let questionHandler: QuestionHandler
    @State var renderingQuestion: Question?
    
    // Survey Completion Check
    @State var response: String = ""
    
    // Initializer - Compare dates to decide if survey has ended
    init (user: UserViewModel) {
        self.user = user
        self.questionHandler = QuestionHandler(user: user)
    }
    
    // View
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                
                if renderingQuestion != nil {
                    QuestionView(response: $response, displayQuestion: questionHandler.currentQuestion)
                    HStack(alignment: .bottom) {
                        
                        Button("Previous") {
                            questionHandler.previousQuestion()
                            renderingQuestion = questionHandler.currentQuestion
                            response = ""
                        }
                        .foregroundColor((questionHandler.isFirst) ? .gray : .blue)
                        .disabled(questionHandler.isFirst)
                        .padding()
                        
                        Spacer()
                        
                        Button("Next") {
                            if (response != "") {
                                questionHandler.nextQuestion()
                                renderingQuestion = questionHandler.currentQuestion
                                response = ""
                            }
                        }
                        .foregroundColor((response != "") ? .blue : .gray)
                        .disabled(response == "")
                        .padding()
                        
                    }
                    .padding(.bottom, 50)
                } else {
                    SurveyEndView(user: user)
                }
                
                Spacer()
            }
            
            Spacer()
        }
    }
}
