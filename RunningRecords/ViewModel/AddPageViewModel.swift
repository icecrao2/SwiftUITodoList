//
//  AddPageViewModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/20.
//

import Foundation
import SwiftUI

class AddPageViewModel: ObservableObject {
    
    private var service: TodoListService = TodoListService()
    
    @Published var todoTitle: String = ""
    @Published var todoDetail: String = ""
    @Published var todoIsCompleted: Bool = false
    @Published var startDate: Date = Date()
    @Published var completeDate: Date = Date()
    
    func addTodo(){
        
        let todoModel: TodoModel = TodoModel(
            todoTitle: todoTitle,
            todoDetail: todoDetail,
            todoIsCompleted: todoIsCompleted,
            startDate: startDate,
            completeDate: completeDate
        )
        
        service.addTodo(model: todoModel)
    }
}
