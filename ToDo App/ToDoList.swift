//
//  ToDoList.swift
//  ToDo App
//
//  Created by Marcelo Menon on 03/18/24.
//

import SwiftUI

struct ToDoList: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: ToDoItem.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \ToDoItem.isCompleted, ascending: true),
            NSSortDescriptor(keyPath: \ToDoItem.dateCompleted, ascending: false),
            NSSortDescriptor(keyPath: \ToDoItem.dateCreated, ascending: false)
        ],
        animation: .default
    )
    var todos: FetchedResults<ToDoItem>
    
    var body: some View {
        List {
            ForEach(todos) { todo in
                ToDoView(todo: todo)
                    .swipeActions {
                        Button {
                            todo.delete()
                        } label: {
                            Text("Delete")
                        }
                        .tint(.red)
                    }
            }
            .listRowBackground(Color.listBackground)
        }
        .overlay(alignment: .center) {
            if todos.isEmpty {
                Text("Tap the '+' button to add a new ToDo")
                    .foregroundStyle(.secondary)
                    .padding()
                    .multilineTextAlignment(.center)
                    .offset(y: -20)
            }
        }
        .animation(.default, value: todos.isEmpty)
    }
}
