//
//  MainView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI

struct MainPageView: View {
    
    @State var text: String = ""
    
    var todoList: [String] = [
        "To do 1",
        "To do 2",
        "To do 3",
        "To do 4",
        "To do 5",
        "To do 6",
        "To do 7",
        "To do 8",
        "To do 9",
        "To do 10",
        "To do 11",
        "To do 12",
        "To do 13",
        "To do 14",
    ]
    
    var body: some View {
        VStack{
            
            SmallIconView()
            
            Text("Todo List")
                .customTitleText()
            
            TextField("Enter your To - Do", text: $text)
                .customLargeTextField()
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 10)
            Spacer(minLength: 0)
            
            
            List{
                ForEach(todoList, id: \.self){ todo in
                    Button {
                        print("clicked")
                    } label: {
                        Text(todo)
                            .customListText()
                    }
                    
                }
            }
        }
    }
}

struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
