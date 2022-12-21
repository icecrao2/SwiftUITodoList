//
//  DetailView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/21.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject var viewModel: DetailViewModel = DetailViewModel()
    
    var indexSets: IndexSet
    
    var body: some View {
        VStack{
            
            Header()
            
            Text(viewModel.todoStringModel.todoTitle)
                .customTitleText()
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .frame(height: 70)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 0.5)
                )
                .padding()
            
            HStack{
                Text(viewModel.todoStringModel.startDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                Text(viewModel.todoStringModel.completeDate ?? "")
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal)
            }
            
            Text("""
                \(viewModel.todoStringModel.todoDetail ?? "")
                """)
            .padding(8)
            .frame(maxWidth: .infinity, alignment: .leading)
            .frame(height: 250, alignment: .top)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 0.5)
            )
                        
        }
        .onAppear{
            viewModel.getTodoStringModel(at: indexSets)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(indexSets: [1])
    }
}
