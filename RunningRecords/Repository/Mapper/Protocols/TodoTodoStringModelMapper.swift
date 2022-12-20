//
//  TodoTodoModelMapper.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation

protocol TodoTodoStringModelMapper {
    
    func mapping(todo: Todo) -> TodoStringModel
    func arrayMapping(todos: [Todo]) -> [TodoStringModel]
}
