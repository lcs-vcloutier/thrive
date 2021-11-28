//
//  Checklist.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-10-26.
//

import SwiftUI

struct Checklist: View {
    
    @Binding var selectionState: String
    var text: String
    
    var body: some View {
        // Add stroke to HStack by wrapping it in the correct element
        // Make fade animations for color switch (should not be slower than .25s and should have .easeInOut)
            HStack {
                Text(text)
                    .padding(.all, 10)
                    .foregroundColor((selectionState == text) ? .white : .black)
                Spacer()
            }
            .background((selectionState == text) ? Color.blue : Color.white)
            .cornerRadius(0.5)
            .border(.black, width: 2)
            .padding()
            .onTapGesture {
                selectionState = (selectionState == text) ? "" : text
            }
    }
}
