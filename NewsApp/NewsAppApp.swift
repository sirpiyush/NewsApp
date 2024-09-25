//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import SwiftUI

@main
struct NewsAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
