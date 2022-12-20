//
//  TodoTodoModelMapper.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation

protocol TodoTodoModelMapper {
    
    func mapping(todo: Todo) -> TodoModel
    func arrayMapping(todos: [Todo]) -> [TodoModel]
}
