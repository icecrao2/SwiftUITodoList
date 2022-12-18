//
//  MainView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI

struct MainPageView: View {
    
    @StateObject private var viewModel: MainPageViewModel = MainPageViewModel()
    @FocusState private var focusField: Field?
    
    @FetchRequest(
      entity: Todo.entity(),
      sortDescriptors: [
        NSSortDescriptor(keyPath: \Todo.todoTitle, ascending: true)
      ]
      //predicate: NSPredicate(format: "genre contains 'Action'")
    ) var todos: FetchedResults<Todo>
    
    
    var body: some View {
        VStack{
            
            SmallIconView()
            
            Text("Todo List")
                .customTitleText()
            
            TextField("Enter your To - Do", text: $viewModel.todoInputed)
                .customLargeTextField()
                .focused($focusField, equals: .inputField)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                .onSubmit {
                    viewModel.todoEnter()
                    focusField = .inputField
                }
            Spacer(minLength: 0)
            
            
            List{
                ForEach(viewModel.todoList, id: \.self){ todo in
                    Button {
                        print("clicked")
                    } label: {
                        Text(todo)
                            .customListText()
                    }
                }
                .onDelete { IndexSet in
                    viewModel.todoRemove(at: IndexSet)
                }
            }
        }
        .onAppear{
            viewModel.todoRefresh()
            focusField = .inputField
        }
    }
    
    enum Field {
      case inputField
      case none
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
