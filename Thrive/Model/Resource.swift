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
    let formattedPhoneNumber: String
    let formattedEmail: String
}

extension Resource {
    static let staticData: [Resource] = [
        Resource(name: "Runza 1", imageName: "person.fill", formattedPhoneNumber: "[705-927-1903](tel:7059271903)", formattedEmail: "[jrunza@lcs.on.ca](mailto:jrunza@lcs.on.ca)"),
        Resource(name: "Runza 2", imageName: "person.fill", formattedPhoneNumber: "[705-927-1903](tel:7059271903)", formattedEmail: "[jrunza@lcs.on.ca](mailto:jrunza@lcs.on.ca)"),
        Resource(name: "Runza 3", imageName: "person.fill", formattedPhoneNumber: "[705-927-1903](tel:7059271903)", formattedEmail: "[jrunza@lcs.on.ca](mailto:jrunza@lcs.on.ca)"),
        Resource(name: "Runza 4", imageName: "person.fill", formattedPhoneNumber: "[705-927-1903](tel:7059271903)", formattedEmail: "[jrunza@lcs.on.ca](mailto:jrunza@lcs.on.ca)"),
        Resource(name: "Runza 5", imageName: "person.fill", formattedPhoneNumber: "[705-927-1903](tel:7059271903)", formattedEmail: "[jrunza@lcs.on.ca](mailto:jrunza@lcs.on.ca)")
    ]
}
