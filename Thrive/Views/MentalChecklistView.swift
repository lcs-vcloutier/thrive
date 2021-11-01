//
//  MentalChecklist.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

struct MentalChecklist: View {
    
    @ObservedObject var scoreVM = ScoreViewModel()
    
    
    
    var body: some View {
        VStack {
            
            GroupBox(label: Label("Heart Rate", systemImage: "heart.fill").foregroundColor(.red)) {
                Text("Your heart rate")
            }.padding()
            
            
            
            
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onTapGesture {
                scoreVM.addCurrentScore(by: 5)
            }
            
            Text("Minus").onTapGesture {
                scoreVM.minusCurrentScore(by: 3)
            }
            
            Text("Set to 15").onTapGesture {
                scoreVM.setCurrentScore(to: 15)
            }
            
            Text("Save").onTapGesture {
                scoreVM.savedCurrentScoreToList()
                scoreVM.reset()
            }
            
            ForEach(scoreVM.scores, id: \.self) { score in
                Text(String(score))
            }
        }
        
    }
}
// Button calculates and saves a score to user defaults - appends it to an array.
// When you call it you'll use the key and display the array
