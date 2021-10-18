//
//  Resource.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-18.
//

import Foundation

struct Resource {
    let name: String
    let imageName: String
    let formattedphoneNumber: String
    let phoneNumber: String
    let formattedEmail: String
    let email: String
}

extension Resource {

    static let staticData: [Resource] = [
        Resource(name: "Runza 0", imageName: "person.fill", formattedphoneNumber: "tel:7059271903", phoneNumber: "(705) 927-1903", formattedEmail: "mailto:jrunza@lcs.on.ca", email: "jrunza@lcs.on.ca"),
        Resource(name: "Runza 1", imageName: "person.fill", formattedphoneNumber: "tel:7059271903", phoneNumber: "(705) 927-1903", formattedEmail: "mailto:jrunza@lcs.on.ca", email: "jrunza@lcs.on.ca"),
        Resource(name: "Runza 2", imageName: "person.fill", formattedphoneNumber: "tel:7059271903", phoneNumber: "(705) 927-1903", formattedEmail: "mailto:jrunza@lcs.on.ca", email: "jrunza@lcs.on.ca"),
        Resource(name: "Runza 3", imageName: "person.fill", formattedphoneNumber: "tel:7059271903", phoneNumber: "(705) 927-1903", formattedEmail: "mailto:jrunza@lcs.on.ca", email: "jrunza@lcs.on.ca"),
        Resource(name: "Runza 4", imageName: "person.fill", formattedphoneNumber: "tel:7059271903", phoneNumber: "(705) 927-1903", formattedEmail: "mailto:jrunza@lcs.on.ca", email: "jrunza@lcs.on.ca")
    ]
}
