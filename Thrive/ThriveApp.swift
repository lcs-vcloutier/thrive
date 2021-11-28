//
//  ThriveApp.swift
//  Thrive
//
//  Created by Vincent Cloutier on 2021-10-04.
//

import SwiftUI

@main
struct iOSApp: App {

    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            SceneManager(/*user: localUser.first*/)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }.onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
                case .background:
                    persistenceController.save()
                case .inactive:
                    return
                case .active:
                    return
                @unknown default:
                    return
            }
        }
    }
}
 

