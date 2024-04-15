//
//  ToDoController.swift
//  ToDo App
//
//  Created by Marcelo Menon on 03/18/24.
//

import Foundation
import CoreData

class ToDoController: ObservableObject {
    @Published var editingID: ObjectIdentifier?
    
    func createTodo(moc: NSManagedObjectContext) {
        let item = ToDoItem(
            viewContext: moc
        )
        
        editingID = item.id
    }
    
    func resetEditing() {
        editingID = nil
        PersistenceController.shared.save()
    }
}
