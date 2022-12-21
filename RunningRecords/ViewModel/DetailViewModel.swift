//
//  DetailViewModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/21.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    
    private let service: TodoListService = TodoListService()
    
    @Published var todoStringModel: TodoStringModel = TodoStringModel(
        id: UUID(),
        todoTitle: "",
        todoDetail: "",
        todoIsCompleted: false,
        startDate: "",
        completeDate: ""
    )
    
    
    func getTodoStringModel(at offsets: IndexSet) {
        
        let todoStringModel:TodoStringModel = service.getOneStringModel(at: offsets)
        
        self.todoStringModel = todoStringModel
    }
}
