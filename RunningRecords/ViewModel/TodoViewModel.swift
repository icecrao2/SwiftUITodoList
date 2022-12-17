//
//  TodoViewModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import Foundation


class TodoViewModel: ObservableObject {
    
    @Published var todoInputed: String = ""
    @Published var todoList: [String] = [
    ]
    
    func todoEnter() {
        todoList.append(todoInputed)
        todoInputed = ""
    }
    
}
