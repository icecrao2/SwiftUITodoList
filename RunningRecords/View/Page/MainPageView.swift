//
//  MainView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI

struct MainPageView: View {
    
    enum Field {
      case inputField
      case none
    }
    
    @StateObject private var todoViewModel: TodoViewModel = TodoViewModel()
    
    @FocusState private var focusField: Field?
    
    var body: some View {
        VStack{
            
            SmallIconView()
            
            Text("Todo List")
                .customTitleText()
            
            TextField("Enter your To - Do", text: $todoViewModel.todoInputed)
                .customLargeTextField()
                .focused($focusField, equals: .inputField)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
                .onSubmit {
                    todoViewModel.todoEnter()
                    focusField = .inputField
                }
            Spacer(minLength: 0)
            
            
            List{
                ForEach(todoViewModel.todoList, id: \.self){ todo in
                    Button {
                        print("clicked")
                    } label: {
                        Text(todo)
                            .customListText()
                    }
                    
                }
            }
        }
        .onAppear{
            focusField = .inputField
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
