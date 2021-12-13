//
//  UserCreationPopOut.swift
//  Thrive
//
//  Created by Efe Yencilek on 2021-11-28.
//

import SwiftUI

struct UserCreationPopOut: View {

    var user: UserViewModel
    
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
                    let checkArray = [userName, userSurname, userAge, userGrade]
                    // Check that age is valid
                    for i in checkArray {
                        guard let _ = i else {
                            feedback = "Please enter a valid age."
                            return
                        }
                    }
                    user.createUser(userName: userName!, userSurname: userSurname!, userAge: userAge!, userGrade: userGrade!)
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

