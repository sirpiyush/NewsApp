//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import SwiftUI

@main
struct NewsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
