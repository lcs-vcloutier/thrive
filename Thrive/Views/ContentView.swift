//
//  ContentView.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    // Add user deafult to setup notification automaitcally
    
    var body: some View {
        VStack {
            ScrollView{
                // TO DO: Explain what the app's about
                HStack{
                    Text("About App")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                    Spacer()
                }
                
                Image("Thrive")
                    .resizable()
                    .scaledToFit()
                
                Text("Thrive At Lakefield Is Something Cool And Fun!")
                    .font(.system(size: 16, weight: .light, design: .default))
                    .multilineTextAlignment(.center)
                
                
                VStack{
                    // For alignment
                    HStack{
                        Text("Fun Facts")
                            .font(.system(size: 32, weight: .semibold, design: .default))
                        Spacer()
                    }
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: true){
                        HStack{
                            ForEach(0..<10){ num in // Fun Facts
                                VStack{
                                    Image("FunFacts")
                                        .resizable()
                                        .frame(width: 150, height: 150)
                                    Text("Fun Facts / Random Statistics")
                                        .font(.system(size: 16, weight: .light, design: .default))
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                    
                
                
                
                // TO DO: Explain THRIVE
                HStack{
                    Text("Explain Thrive")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                    Spacer()
                }
                
                Image("Thrive")
                    .resizable()
                    .scaledToFit()
                
                Text("Thrive At Lakefield Is Something Cool And Fun!")
                    .font(.system(size: 16, weight: .light, design: .default))
                    .multilineTextAlignment(.center)
                
                
                // TO DO: Explain Developers
                HStack{
                    Text("Explain Developers")
                        .font(.system(size: 32, weight: .semibold, design: .default))
                }

                
                // Add link to mental health at Lakefieldd
                
                // this button is only for placeholder
                Button("Would you like to receive motivational quotes everyday?", action: setUpNotification)
                
                Spacer() // Pushes everything to the top
            }
            
            .navigationBarTitle("Home Page")
        }
        .task {
            askUserNotificationPermission()
        }
        
    }
}
