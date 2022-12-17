//
//  ContentView.swift
//  RunningRecords
//
//  Created by sw on 2022/12/16.
//

import SwiftUI

struct ContentView: View {
    
    @State var onLogoAnimation: Bool = true
    
    var body: some View {
        
        switch onLogoAnimation{
        case true:
            LoadingView()
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                        onLogoAnimation = false
                        print("end")
                    })
                }
        case false:
            MainPageView()
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
