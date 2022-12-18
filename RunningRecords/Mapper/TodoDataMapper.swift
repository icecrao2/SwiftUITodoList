//
//  TodoDataMapper.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation
import CoreData


class TodoDataMapper: MappingToModelProtocol {
    
    
    func mappingToModels<O>(original: [O]) -> [TodoModel] where O : TodoDataModelProtocol {
        
        let origin: [Todo] = original as! [Todo]
        var todoModels: [TodoModel] = []
        
        origin.forEach { todo in
            todoModels.append(
                mappingToModel(original: todo)
            )
        }
        
        return todoModels
    }
    
    func mappingToModel<O>(original: O) -> TodoModel where O : TodoDataModelProtocol {
        
        let origin: Todo = original as! Todo
        
        return TodoModel(
            todoTitle: origin.todoTitle!,
            todoDetail: origin.todoDetail ?? "",
            todoIsCompleted: origin.todoIsCompleted,
            startDate: origin.writenDate!,
            completeDate: origin.completeDate
        )
    }
}
