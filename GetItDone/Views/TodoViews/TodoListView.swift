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
    @State private var showWeatherDetails = false
    
    var body: some View {
        NavigationStack{
            VStack{
                
                WeatherView()
                    .onTapGesture {
                        showWeatherDetails = true
                    }
                    .sheet(isPresented: $showWeatherDetails){
                        WeatherDetailsView()
                            .ignoresSafeArea(.all, edges: .bottom)
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
}

#Preview {
    TodoListView()
}
