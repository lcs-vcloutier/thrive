//
//  QuestionView.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-25.
//

import SwiftUI

struct QuestionView: View {
    
    // Will be mutated by the checklist items
    @Binding var response: String
    
    var displayQuestion: Question

    var body: some View {
        HStack(alignment: .top) {
            Text(displayQuestion.question)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.size.width)
        .foregroundColor(.white)
        .background(Color.blue)
        ForEach((0...displayQuestion.answers.count - 1), id: \.self) { a in
            Checklist(selectionState: $response, text: displayQuestion.answers[a])
        }
        
    }
    
    // Add an next button that'll lead the user to the next question.
}
