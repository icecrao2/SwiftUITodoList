//
//  TodoDataMapper.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation


class TodoDataStringMapper: TodoTodoStringModelMapper {
    
    func arrayMapping(todos: [Todo]) -> [TodoStringModel] {
        
        var results: [TodoStringModel] = []
        
        todos.forEach { todo in
            results.append(mapping(todo: todo))
        }
        return results
    }
    
    func mapping(todo: Todo) -> TodoStringModel {
        
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        let startDate: Date? = todo.writenDate
        let endDate: Date? = todo.completeDate
        var strStartDate: String?
        var strEndDate: String?
        
        if startDate == nil{
            strStartDate = nil
        }else{
            strStartDate = formatter.string(from: startDate!)
        }
        
        if endDate == nil {
            strEndDate = nil
        }else {
           strEndDate = formatter.string(from: endDate!)
        }
        
        let result = TodoStringModel(
            todoTitle: todo.todoTitle!,
            todoDetail: todo.todoDetail,
            todoIsCompleted: todo.todoIsCompleted,
            startDate: strStartDate ?? "",
            completeDate: strEndDate
        )
        return result
    }
}
