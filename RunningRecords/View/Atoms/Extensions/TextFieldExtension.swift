//
//  TextField.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI


extension TextField {
    
    func customLargeTextField() -> some View {
        self
            .font(Font.system(size: 30))
            .fontWeight(Font.Weight.bold)
            .frame(height: 60)
            .padding(.leading, 20)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.black.opacity(0.5), lineWidth: 0.5)
            )
            
    }
}

