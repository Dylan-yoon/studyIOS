//
//  SwiftUIPracticeApp.swift
//  SwiftUIPractice
//
//  Created by 윤병희 on 2022/01/30.
//

import SwiftUI

@main
struct SwiftUIPracticeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
