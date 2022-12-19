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
    
    @Published var todoInputed: String = ""
    @Published var todoList: [String] = [
        
    ]
    
    func todoRefresh() {
        
    }
    
    func todoEnter() {
//        repo.addTodo(
//            title: todoInputed,
//            detail: "detail"
//        )
        todoList.append(todoInputed)
        todoInputed = ""
    }
    
    func todoRemove(at offsets: IndexSet) {
//
//        todoList.remove(atOffsets: offsets)
//        repo.deleteTodo(at: offsets)
        
    }
    

    
}
