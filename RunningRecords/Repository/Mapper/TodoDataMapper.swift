//
//  TodoDataMapper.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation


class TodoDataMapper: TodoTodoModelMapper {
    
    func arrayMapping(todos: [Todo]) -> [TodoModel] {
        
        var results: [TodoModel] = []
        
        todos.forEach { todo in
            results.append(mapping(todo: todo))
        }
        return results
    }
    
    func mapping(todo: Todo) -> TodoModel {
        
        let result = TodoModel(
            todoTitle: todo.todoTitle!,
            todoDetail: todo.todoDetail,
            todoIsCompleted: todo.todoIsCompleted,
            startDate: todo.writenDate!,
            completeDate: todo.completeDate
        )


        return result
    }
}
