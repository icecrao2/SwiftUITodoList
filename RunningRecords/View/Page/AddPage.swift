//
//  AddPage.swift
//  RunningRecords
//
//  Created by sw on 2022/12/19.
//

import SwiftUI

struct AddPage: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel: AddPageViewModel = AddPageViewModel()
    @GestureState private var dragOffset = CGSize.zero
    
    @State private var startCalandarID: UUID = UUID()
    @State private var endCalandarID: UUID = UUID()
    
    var body: some View {
        VStack{
            
            Header()
            
            TextField("Title", text: $viewModel.todoTitle)
                .customDefaultTExtField()
                .padding(.horizontal)
            
            DatePicker("Start Date", selection: $viewModel.startDate, in: Date()..., displayedComponents: .date)
                    .padding(.horizontal)
                    .id(startCalandarID)
                    .onChange(of: viewModel.startDate) { _ in
                        startCalandarID = UUID()
                    }
                
            DatePicker("End Date", selection: $viewModel.completeDate, in: viewModel.startDate..., displayedComponents: .date)
                .padding(.horizontal)
                .id(endCalandarID)
                .onChange(of: viewModel.completeDate) { _ in
                    print(viewModel.completeDate)
                    endCalandarID = UUID()
                }
                    
            
            TextField("", text: $viewModel.todoDetail, axis: .vertical)
                .customLargeTextField()
                .padding(.horizontal)
            
            Button {
                viewModel.addTodo()
                self.presentationMode.wrappedValue.dismiss()
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
