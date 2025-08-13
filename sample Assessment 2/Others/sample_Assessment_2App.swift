//
//  sample_Assessment_2App.swift
//  sample Assessment 2
//
//  Created by Netaxis on 08/08/25.
//

import SwiftUI
import CoreData

@main
struct sample_Assessment_2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
