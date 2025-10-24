//
//  TodoListView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @State var listItems = ["Eat", "Clean", "Work", "Gym"]
    @Environment(\.modelContext) var modelContext
    
//    @Query(sort: [
//        SortDescriptor(\TodoItem.title),
//        SortDescriptor(\TodoItem.details)
//    ]) var todos: [TodoItem]
    
    var body: some View {
        NavigationStack{
            List{
                Section("To-do"){
                    ForEach(listItems, id: \.self){ item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItem)
                }
                
                
                
                Section("Done"){
                    ForEach(listItems, id: \.self){ item in
                        Text(item)
                    }
                    .onDelete(perform: deleteItem)
                }
                
            }
            .navigationTitle("Get It Done")
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing){
                    Button("Add", action: {
                        let newItem = TodoItem(title: "eat", details: "make dinner", isCompleted: false)
                        modelContext.insert(newItem)
                        deleteAllTodos()
                        printItems()
                    })
                }
            }
        }
        
    }
    
    func deleteItem(indexSet: IndexSet){
        listItems.remove(atOffsets: indexSet)
    }
    
    func printItems(){
        let fetchDescriptor = FetchDescriptor<TodoItem>()
        do{
            let todos = try modelContext.fetch(fetchDescriptor)
            
            for todo in todos{
                print(todo.title)
                print(todo.details)
            }
        } catch{
            print("Failed to fetch TodoItems: \(error)")
        }
        
    }
    
    func deleteAllTodos() {
        do {
            let fetchDescriptor = FetchDescriptor<TodoItem>()
            let allTodos = try modelContext.fetch(fetchDescriptor)
            for todo in allTodos {
                modelContext.delete(todo)
            }
        } catch {
            print("Failed to fetch todos: \(error)")
        }
    }

}

#Preview {
    TodoListView()
}
