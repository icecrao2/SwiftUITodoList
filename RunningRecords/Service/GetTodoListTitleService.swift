//
//  GetTodoListService.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation

class TodoListService {
    
    private let repository: TodoDataRepositoryProtocol = TodoDataRepository()
    
    func getAllTitles() -> [String]{
        
        let todoModels:[TodoModel] = repository.readTodoAll()
        
        var todoTitles:[String] = []
        
        todoModels.forEach { model in
            todoTitles.append(model.todoTitle)
        }
        
        return todoTitles
    }
    
    
    func addTodo(model: TodoModel) {
        
        repository.addTodo(model: model)
        
    }
    
    func deleteTodo(at offsets: IndexSet) {
    
        repository.deleteTodo(at: offsets)
        
    }
    
}
