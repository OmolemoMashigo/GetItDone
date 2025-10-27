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
    @State private var showingAlert = false
    
    
    var body: some View {
    
        NavigationStack {
            VStack{
                Form{
                    Section{
                        TextField("add task", text: $taskTitle)
                    }
                    
                    Section("description"){
                        TextEditor(text: $taskDescription)
                    }
                    
                    Button("Add"){
                        
                        if isValidInput(){
                            let todoItem = TodoItem(title: taskTitle, details: taskDescription, isCompleted: false)
                            modelContext.insert(todoItem)
                            dismiss()
                        }
                    }
                }
            }
            .navigationTitle("Add task")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Your task must be at least 3 characters long"))
                
            }
        }
        
    }
    
            func isValidInput() -> Bool{
                if taskTitle.count < 3{
                    showingAlert = true
                    return false
                }
                return true
            }
    
}

#Preview {
    AddItemView()
}
