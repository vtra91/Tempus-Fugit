//
//  Tempus_FugitApp.swift
//  Tempus Fugit
//
//  Created by Сергей Мельников on 18.02.2026.
//

import SwiftUI
import CoreData

@main
struct Tempus_FugitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
