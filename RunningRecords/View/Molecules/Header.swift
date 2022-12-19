//
//  Header.swift
//  RunningRecords
//
//  Created by sw on 2022/12/19.
//

import SwiftUI

struct Header: View {
    var body: some View {
        VStack {
            SmallIconView()
            
            Text("Todo List")
                .customTitleText()
        }
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
