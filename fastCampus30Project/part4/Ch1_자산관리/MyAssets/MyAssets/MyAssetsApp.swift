//
//  MyAssetsApp.swift
//  MyAssets
//
//  Created by 윤병희 on 2022/02/04.
//

import SwiftUI

@main
struct MyAssetsApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
