//
//  TodoModel.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation


struct TodoModel: CoreDataModelProtocol {
    
    let todoTitle: String
    let todoDetail: String?
    let todoIsCompleted: Bool
    let startDate: Date
    let completeDate: Date?
    
}
