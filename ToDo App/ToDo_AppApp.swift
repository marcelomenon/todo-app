//
//  ToDo_AppApp.swift
//  ToDo App
//
//  Created by Marcelo Menon on 03/18/24.
//

import SwiftUI

@main
struct ToDo_AppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}
