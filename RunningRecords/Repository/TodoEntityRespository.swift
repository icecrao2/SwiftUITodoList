//
//  TodoEntityRespository.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation
import SwiftUI
import CoreData

struct TodoEntityRepository {
    
    var managedObjectContext = PersistenceController.shared.container.viewContext
    
    var todos = [Todo]()
    
    
    mutating func repositoryInitial() {
        
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        do {
            todos = try managedObjectContext.fetch(request)
        } catch {
            print("ERROR FETCHING CORE DATA")
            print(error.localizedDescription)
        }
        
        todos.forEach { todo in
            print(todo.todoTitle!)
        }
    }
    
    
    func saveContext() {
        do {
            try managedObjectContext.save()
        } catch {
            print("Error saving managed object context: \(error)")
        }
    }
    
    func addTodo(title: String, detail: String) {
        let newTodo = Todo(context: managedObjectContext)

        newTodo.todoTitle = title
        newTodo.todoDetail = detail
        newTodo.todoIsCompleted = false
        newTodo.writenDate = Date()
        newTodo.completeDate = nil
        
        saveContext()
    }

    func deleteTodo(at offsets: IndexSet) {
      offsets.forEach { index in
        let movie = self.todos[index]
        self.managedObjectContext.delete(movie)
      }
      saveContext()
    }
}
