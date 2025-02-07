//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Amr El-Fiqi on 07/02/2025.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
