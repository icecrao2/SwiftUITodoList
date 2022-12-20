//
//  Repository.swift
//  RunningRecords
//
//  Created by sw on 2022/12/18.
//

import Foundation

/*
 변수
 1. 사용해야 할 DB 의 종류가 변할 수 있다.
    -> Repository 프로토콜을 이용하여 여러 버전의 DB를 도메인 단에서 유동적으로 사용할 수 있게 해줌
 2. 서버로 부터 받은 리턴 데이터가 변하고 그에 따라 도메인 단으로 보낼 데이터타입이 변경 될 수 있다. -> 이는 도메인단도 함께 수정해야하는 문제를 발생시킨다.
    -> 내부적으로 도메인 단에서 필요한 데이터로 리턴 데이터를 정리하여 보내주면 된다.
 3. 서버에 보내야 할 데이터가 변할 수 있다.
    -> 이건 어쩔 수 없이 데이터 단 내부에서 상황에 따라 직접 수정해줘야한다.
 */

protocol TodoDataRepositoryProtocol{
    
    func addTodo(model: TodoModel)
    func readTodoAll() -> [TodoModel]
    func deleteTodo(at offsets: IndexSet)

}
