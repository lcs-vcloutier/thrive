//
//  UserCreationPopOut.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI

struct UserCreationPopOut: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var userMutating: User?
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                
                Button("Create User") {
                    let user = User(context: viewContext)
                    user.name = "Efe"
                    user.surname = "Yencilek"
                    user.age = 17
                    user.grade = "11"
                    user.dayStreak = 0
                    user.totalScore = 0
                    user.lastTestDate = nil
                    print(user)
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    userMutating = user
                }
            }
            .padding()
            .padding()
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .transition(.move(edge: .bottom))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

