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
    
    @State var userName: String?
    @State var userSurname: String?
    @State var userAge: String?
    @State var userGrade: String?
    
    @State var feedback = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.black
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    TextField("Name", text: $userName.bound)
                        .padding(.horizontal, 10)
                        .border(.blue, width: 2)
                        .cornerRadius(0.35)
                    TextField("Surname", text: $userSurname.bound)
                        .padding(.horizontal, 10)
                        .border(.blue, width: 2)
                        .cornerRadius(0.35)

                }
                .padding(.vertical, 7)
                
                TextField("Surname", text: $userAge.bound)
                    .keyboardType(.numberPad)
                
                Picker("Grade", selection: $userGrade.bound) {
                    ForEach(9 ..< 13) {
                        Text("\($0)th Grade")
                    }
                }
                .padding(.vertical, 7)
                
                Button("Create User") {
                    // Check that age is valid
                    guard let finalAge = userAge else {
                        feedback = "Please enter a valid age."
                        return
                    }
                    let user = User(context: viewContext)
                    user.name = "Efe"
                    user.surname = "Yencilek"
                    user.age = Int16(Int(finalAge)!)
                    user.grade = "11"
                    user.dayStreak = 0
                    user.totalScore = 0
                    user.lastTestDate = nil
                    // Debug
                    //print(user)
                    do {
                        try viewContext.save()
                    } catch {
                        print(error.localizedDescription)
                    }
                    userMutating = user
                }
                .disabled(userName == nil || userSurname == nil || userAge == nil || userGrade == nil)
                .padding(.vertical, 7)
            }
            .padding(30)
            .frame(height: 500)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .transition(.move(edge: .bottom))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
}

