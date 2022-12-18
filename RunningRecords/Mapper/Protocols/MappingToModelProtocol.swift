//
//  MapperProtocol.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation
import CoreData

extension Todo: TodoDataModelProtocol {
    
}

protocol MappingToModelProtocol {
    
    //associatedtype Original
    
    func mappingToModels<O: TodoDataModelProtocol>(original: [O]) -> [TodoModel]
    func mappingToModel<O: TodoDataModelProtocol>(original: O) -> TodoModel
}
