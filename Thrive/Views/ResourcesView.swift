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
                VStack(alignment: .leading) {
                    Label(item.name, systemImage: item.imageName)
                        .foregroundColor(.blue)
                    VStack {
                        Text(makeAttributedString(with: item.formattedPhoneNumber))
                        Text(makeAttributedString(with: item.formattedEmail))
                    }
                    .foregroundColor(.black)
                    .font(.title)
                }
            }
        }
        .navigationBarTitle("Resources")
    }
    func makeAttributedString(with givenText: String) -> AttributedString {
        return (try? AttributedString(markdown: givenText)) ?? AttributedString()
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
