//
//  ScoreViewModel.swift
//  Thrive
//
//  Created by Sihan Chen on 2021-10-18.
//

import Foundation
import UIKit

class ScoreViewModel: ObservableObject {
    
    @Published var scores: [Int] = []
    
    static let initialScore = 0
    
    var currentScore = initialScore
    
    func addCurrentScore(by amountAdded: Int) {
        currentScore += amountAdded
        print(currentScore)
    }
    
    func minusCurrentScore(by amountSubtracted: Int) {
        currentScore -= amountSubtracted
        print(currentScore)
    }
    
    func getCurrentScore() -> Int {
        print("func used")
        return currentScore
    }
  
    func setCurrentScore(to number: Int){
        currentScore = number
        print(currentScore)
    }
    
    func savedCurrentScoreToList() {
        print("Score successfully saved")
        scores.append(currentScore)
    }
    
    func reset() {
        currentScore = 0
    }
    
    
}
