//
//  About.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

struct ResourcesView: View {
    var body: some View {
        List {
            // Loop through static data
            ForEach(Resource.staticData, id: \.name) { item in
                VStack(alignment: .leading){
                    Label(item.name, systemImage: item.imageName)
                        .foregroundColor(.blue)
                    VStack {
                        Link(item.phoneNumber, destination: URL(string: item.formattedphoneNumber)!)
                        Link(item.email, destination: URL(string: item.formattedEmail)!)
                    }
                    .foregroundColor(.black)
                    .font(.title)
                }
            }
        }
        .navigationBarTitle("Resources")
    }
}

