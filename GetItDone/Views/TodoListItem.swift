//
//  TodoListItem.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/25.
//

import SwiftUI

struct TodoListItem: View {
    
    let todoItem: TodoItem
    
    var body: some View {
        HStack {
            Image(systemName: todoItem.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(todoItem.isCompleted ? .green :.red)
                
            VStack{
                Text(todoItem.title)
                    .font(.title3)
                
                if !todoItem.details.isEmpty {
                    Text(todoItem.details)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

#Preview {
    let item1 = TodoItem(title: "feed the dog", details: "beef tonight", isCompleted: true)
    let item2 = TodoItem(title: "feed the cat", details: "fish tonight", isCompleted: false)
    
    Group{
        TodoListItem(todoItem: item1)
        TodoListItem(todoItem: item2)
    }
}
