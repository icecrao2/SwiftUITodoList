//
//  TodoDataUseCase.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//


import Foundation

class TodoDataUseCase {
    
    let repository: TodoDataRepositoryProtocol
    let mapper: any MappingToModelProtocol
    
    
    init(repository: TodoDataRepositoryProtocol, mapper: any MappingToModelProtocol) {
        self.repository = repository
        self.mapper = mapper
    }
    
    
    func getAllTodoDataTitle() -> [String] {
        let todoModels: [TodoModel] = getAllTodoData()
        var todoModelTitles: [String] = []
        
        todoModels.forEach { todoModel in
            todoModelTitles.append(todoModel.todoTitle)
        }
        
        return todoModelTitles
    }
    
    func getAllTodoData() -> [TodoModel] {
        
        let todos: [Todo] = repository.readTodoAll()
        let todoModels: [TodoModel] = mapper.mappingToModels(original: todos)
        
        return todoModels
    }
    
}
