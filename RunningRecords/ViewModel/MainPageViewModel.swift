//
//  TodoViewModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import Foundation
import SwiftUI
import CoreData

//MainPage를 컨트롤하는 클래스
class MainPageViewModel: ObservableObject {
    
    private var service: TodoListService = TodoListService()
    
    @Published var todoList: [String] = []
    
    func todoRefresh() {
        todoList = []
        todoList = service.getAllTitles()
    }
    
    func todoRemove(at offsets: IndexSet) {

        todoList.remove(atOffsets: offsets)
        service.deleteTodo(at: offsets)
        
    }
}
