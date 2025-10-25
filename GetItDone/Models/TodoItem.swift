//
//  TodoItem.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftData
import Foundation

@Model
class TodoItem: Identifiable{
    var id = UUID()
    var title: String
    var details: String
    var isCompleted: Bool
    
    init(title: String, details: String, isCompleted: Bool) {
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
    }
}
