//
//  TodoEntityRespository.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation
import SwiftUI
import CoreData

class TodoDataRepository: TodoDataRepositoryProtocol {
    
    
    private var managedObjectContext = PersistenceController.shared.container.viewContext
    
    private var todos = [Todo]()
    
    func readTodoAll() -> [Todo] {
        
        fetchTodo()
        
        var todoModels: [TodoModel] = []
        
        todos.forEach { todo in
            todoModels.append(
                TodoModel(
                    todoTitle: todo.todoTitle!,
                    todoDetail: todo.todoDetail ?? "",
                    todoIsCompleted: todo.todoIsCompleted,
                    startDate: todo.writenDate!,
                    completeDate: todo.completeDate
                )
            )
        }
        return todos
    }
    
    func addTodo(title: String, detail: String) {
        let newTodo = Todo(context: managedObjectContext)

        newTodo.todoTitle = title
        newTodo.todoDetail = detail
        newTodo.todoIsCompleted = false
        newTodo.writenDate = Date()
        newTodo.completeDate = nil
        
        PersistenceController.shared.saveContext()
        
        self.fetchTodo()
    }

    func deleteTodo(at offsets: IndexSet) {
        
        offsets.forEach { index in
            let todo = self.todos[index]
            self.managedObjectContext.delete(todo)
        }
        
        PersistenceController.shared.saveContext()
        self.fetchTodo()
    }
    
    
    
    private func fetchTodo() {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        do {
            todos = try managedObjectContext.fetch(request)
        } catch {
            print("ERROR FETCHING CORE DATA")
            print(error.localizedDescription)
        }
    }
}
