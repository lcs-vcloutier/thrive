//
//  About.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

struct Resources: View {

    var body: some View {
        
        List {
            // Loop through static data
            ForEach(Resource.staticData, id: \.name) { item in

                GroupBox(
                    label: Label(item.name, systemImage: item.imageName)
                        .foregroundColor(.blue)
                ) {
                    VStack {
                        Link(item.phoneNumber, destination: URL(string: item.formattedphoneNumber)!)
                        Link(item.email, destination: URL(string: item.formattedEmail)!)
                    }
                    .font(.title)
                    
                }
                
            }
        }
        .navigationBarTitle("Resources")
    }
}

