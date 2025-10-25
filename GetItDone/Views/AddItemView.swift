//
//  AddItemView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var taskTitle = ""
    @State private var taskDescription = ""
    
    var disbleSave: Bool{
        if taskTitle.count < 3{
            return true
        }
        return false
    }
    
    var body: some View {
    
        NavigationStack {
            Form{
                Section{
                    TextField("add task", text: $taskTitle)
                    DatePicker("due date", selection: .constant(Date()))
                }
                
                Section("description"){
                    TextEditor(text: $taskDescription)
                }
                
                Button("Add"){
                    let todoItem = TodoItem(title: taskTitle, details: taskDescription, isCompleted: false)
                    modelContext.insert(todoItem)
                    dismiss()
                }
                .disabled(disbleSave)
            }
            .navigationTitle("Add task")
        }
    }
    
}

#Preview {
    AddItemView()
}
