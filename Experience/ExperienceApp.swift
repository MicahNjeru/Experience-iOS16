//
//  ExperienceApp.swift
//  Experience
//
//  Created by Micah Jesse Njeru on 06/06/2023.
//

import SwiftUI

@main
struct ExperienceApp: App {
    @StateObject private var dataController  = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
