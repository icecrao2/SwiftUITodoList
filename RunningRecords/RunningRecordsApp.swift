//
//  RunningRecordsApp.swift
//  RunningRecords
//
//  Created by sw on 2022/12/16.
//

import SwiftUI


 @main
struct RunningRecordsApp: App {
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
