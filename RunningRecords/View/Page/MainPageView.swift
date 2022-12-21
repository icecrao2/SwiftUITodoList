//
//  MainView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI

struct MainPageView: View {
    
    @StateObject private var viewModel: MainPageViewModel = MainPageViewModel()
    
    var body: some View {
        NavigationStack{
            
            Header()
            
            NavigationLink {
                AddPage()
            } label: {
                Text("Add Todo!")
                    .customButtonText()
            }
            List{
                ForEach(viewModel.todoList.indices, id: \.self){ index in
                    
                    NavigationLink(destination: DetailView(indexSets: [index])){
                        Text(viewModel.todoList[index])
                            .customListText()
                    }
                }
                .onDelete { IndexSet in
                    viewModel.todoRemove(at: IndexSet)
                }
            }
            .onAppear{
                print("refresh@")
                viewModel.todoRefresh()
            }
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
