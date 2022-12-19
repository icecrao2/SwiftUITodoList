//
//  Loading.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            BigIconView()
            
            Text("To do List")
                .customTitleText()
                .padding()
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
