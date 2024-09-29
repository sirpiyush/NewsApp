//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import SwiftUI

@main
struct NewsApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
