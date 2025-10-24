//
//  TodoItem.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftData

@Model
class TodoItem{
    var title: String
    var details: String
    var isCompleted: Bool
    
    init(title: String, details: String, isCompleted: Bool = false) {
        self.title = title
        self.details = details
        self.isCompleted = false
    }
}
