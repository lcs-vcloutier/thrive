//
//  UserCreationPopOut.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI

struct UserCreationPopOut: View {

    // View Model to create user
    @ObservedObject var user: UserViewModel
    
    // User inputs to create user
    @State var userName: String = ""
    @State var userSurname: String = ""
    @State var userAge: String = ""
    @State var userGrade: Grade = .nine
    
    // Binding showing value to dismiss the screen
    @Binding var showing: Bool
    
    @State var feedback: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    HStack {
                        TextField("Name", text: $userName)
                        TextField("Surname", text: $userSurname)
                    }
                    
                    TextField("Age", text: $userAge)
                        .keyboardType(.numberPad)
                    Picker("Grade", selection: $userGrade) {
                        Text(Grade.nine.rawValue).tag(Grade.nine)
                        Text(Grade.ten.rawValue).tag(Grade.ten)
                        Text(Grade.eleven.rawValue).tag(Grade.eleven)
                        Text(Grade.twelve.rawValue).tag(Grade.twelve)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
            }
            .navigationTitle("Create User")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showing.toggle()
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Save") {
                        // Try to turn userAge into an int, if not possible throw a feedback message
                        // Use guard let and pass in the integer value as a parameter instead
                        
                        guard let userAgeInt = Int(userAge) else {
                                feedback = "Please provide a valid age."
                                return
                        }
                        
                        user.createUser(userName: userName, userSurname: userSurname, userAge: userAgeInt, userGrade: userGrade.rawValue)
                        
                        showing.toggle()
                    }
                    .disabled(userName.isEmpty || userSurname.isEmpty || userAge.isEmpty)
                }
            }
        }
        .interactiveDismissDisabled()
    }
}

