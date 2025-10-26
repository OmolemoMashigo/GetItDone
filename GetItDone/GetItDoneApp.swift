//
//  GetItDoneApp.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftUI
import SwiftData

@main
struct GetItDoneApp: App {
    var body: some Scene {
        WindowGroup {
            //TodoListView()
            WeatherView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
