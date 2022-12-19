//
//  AddPage.swift
//  RunningRecords
//
//  Created by sw on 2022/12/19.
//

import SwiftUI

struct AddPage: View {
    
    
    
    @State var todoTitle: String = ""
    @State var todoDetail: String = ""
    @State var todoIsCompleted: Bool = false
    @State var startDate: Date = Date()
    @State var completeDate: Date = Date()
    
    var body: some View {
        VStack{
            Header()
            
            TextField("Title", text: $todoTitle)
                .customDefaultTExtField()
                .padding(.horizontal)
            
                DatePicker("Start Date", selection: $startDate, in: Date()..., displayedComponents: .date)
                    .padding(.horizontal)
                
                DatePicker("End Date", selection: $completeDate, in: startDate..., displayedComponents: .date)
                    .padding(.horizontal)
            
            
            TextField("", text: $todoDetail, axis: .vertical)
                .customLargeTextField()
                .padding(.horizontal)
            
            Button {
            
            } label: {
                Text("Submit")
                    .customButtonText()
            }

            
        }
    }
}

struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}
