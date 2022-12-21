//
//  GetTodoListService.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation

class TodoListService {
    
    private let repository: TodoDataRepositoryProtocol = TodoDataRepository()
    
    func getTodoStringModels() -> [TodoStringModel] {
        let todoModels: [TodoStringModel] = repository.readTodoAll()
        
        return todoModels
    }
    
    func getAllTitles() -> [String]{
        
        var todoModels:[TodoStringModel] = []
        var todoTitles:[String] = []
        
        todoModels = repository.readTodoAll()
        
        todoModels.forEach { model in
            todoTitles.append(model.todoTitle)
        }
        
        return todoTitles
    }
    
    func getOneStringModel(at offsets: IndexSet) -> TodoStringModel {
        return repository.readTodo(at: offsets)
    }
    
    func addTodo(model: TodoModel) {
        repository.addTodo(model: model)
    }
    
    func deleteTodo(at offsets: IndexSet) {
        repository.deleteTodo(at: offsets)
    }
    
}
