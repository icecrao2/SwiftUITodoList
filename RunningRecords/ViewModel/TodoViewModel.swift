//
//  TodoViewModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import Foundation
import SwiftUI
import CoreData

class TodoViewModel: ObservableObject {
    
    var managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var todos = [Todo]()
    
    
    @Published var todoInputed: String = ""
    @Published var todoList: [String] = [
    ]
    
    var repo: TodoEntityRepository = TodoEntityRepository()
    
    func todoInitial() {
        let request = NSFetchRequest<Todo>(entityName: "Todo")
        do {
            todos = try managedObjectContext.fetch(request)
        } catch {
            print("ERROR FETCHING CORE DATA")
            print(error.localizedDescription)
        }
        
        repo.repositoryInitial()
    }
    
    func todoEnter() {
        repo.addTodo(
            title: todoInputed,
            detail: "detail"
        )
        todoList.append(todoInputed)
        todoInputed = ""
    }
    
    func todoRemove(at offsets: IndexSet) {
        todoList.remove(atOffsets: offsets)
        repo.deleteTodo(at: offsets)
    }
    

    
}
