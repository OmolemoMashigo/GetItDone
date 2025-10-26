//
//  TodoListView.swift
//  GetItDone
//
//  Created by Omolemo Mashigo on 2025/10/24.
//

import SwiftUI
import SwiftData

struct TodoListView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query(filter: #Predicate<TodoItem> { !$0.isCompleted })
    private var todos: [TodoItem]

    @Query(filter: #Predicate<TodoItem> { $0.isCompleted })
    private var doneItems: [TodoItem]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                NavigationLink(destination: WeatherDetailsView()) {
                    WeatherView()
                }
                
                List{
                    
                    Section("To-do"){
                        ForEach(todos){ item in
                            TodoListItem(todoItem: item)
                                .onTapGesture {
                                    updateItems(todoItem: item)
                                }
                        }
                        .onDelete(perform: deleteTodoItem)
                    }
                    
                    
                    
                    Section("Done"){
                        ForEach(doneItems){ item in
                            TodoListItem(todoItem: item)
                                .onTapGesture {
                                    updateItems(todoItem: item)
                                }
                        }
                        .onDelete(perform: deleteDoneItem)
                    }
                    
                }
                //.animation(.linear.delay(Double(num)/20), value: amountDragged)
                //.animation(.bouncy, value: amountDragged)
                .animation(.easeInOut, value: todos)
                .animation(.easeInOut, value: doneItems)
                .navigationTitle("Get It Done")
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Add", action: {
                            showingAddScreen.toggle()
                        })
                    }
                }
                .sheet(isPresented: $showingAddScreen){
                    AddItemView()
                }
            }
        }
        
    }
    
    func updateItems(todoItem: TodoItem){
        todoItem.isCompleted.toggle()
        try? modelContext.save()
        
    }
    
    func deleteTodoItem(at offsets: IndexSet){
        for offset in offsets{
            let todo = todos[offset]
            modelContext.delete(todo)
        }
        print("delete")
    }
    
    func deleteDoneItem(at offsets: IndexSet){
        for offset in offsets{
            let done = doneItems[offset]
            modelContext.delete(done)
        }
        print("delete")
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
