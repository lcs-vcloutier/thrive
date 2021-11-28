//
//  QuestionView.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-25.
//

import SwiftUI

struct QuestionView: View {
    
    // Callback function iterating to the next view
    var callback: () -> ()
    
    // Will be mutated by the checklist items
    @State var response: String = ""
    
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
        
        HStack(alignment: .bottom) {
            Spacer()
            Button("Next") {
                if (response != "") {
                    callback()
                }
            }
            .foregroundColor((response != "") ? .blue : .gray)
        }
        .padding(.bottom, 50)
        
    }
    
    // Add an next button that'll lead the user to the next question.
}
