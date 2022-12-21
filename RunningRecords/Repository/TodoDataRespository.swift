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
    private let mapper:  TodoTodoStringModelMapper = TodoDataStringMapper()
    
    private var todos = [Todo]()
    
    
    func readTodoAll() -> [TodoStringModel] {
        self.fetchTodo()
        let todoModels = mapper.arrayMapping(todos: todos)
        return todoModels
    }
    
    func readTodo(at offsets: IndexSet) -> TodoStringModel {
        self.fetchTodo()
        var todo: Todo = Todo()
        
        offsets.forEach { index in
            todo = self.todos[index]
        }
        
        return mapper.mapping(todo: todo)
    }
    
    func addTodo(model: TodoModel) {
        let newTodo = Todo(context: managedObjectContext)

        newTodo.id = UUID()
        newTodo.todoTitle = model.todoTitle
        newTodo.todoDetail = model.todoDetail
        newTodo.todoIsCompleted = false
        newTodo.writenDate = model.startDate
        newTodo.completeDate = model.completeDate
        
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
