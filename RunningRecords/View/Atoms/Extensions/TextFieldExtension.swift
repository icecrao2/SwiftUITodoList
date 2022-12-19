//
//  TextField.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI


extension TextField {
    
    
    func customDefaultTExtField() -> some View {
        self
            .foregroundColor(.black)
            .frame(height: 40)
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 0.5)
            )
            .font(Font.system(size: 25))
            .fontWeight(Font.Weight.bold)
    }
    
    func customLargeTextField() -> some View {
        self
            .foregroundColor(.black)
            .lineLimit(12, reservesSpace: true)
            .padding(5)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 0.5)
            )
            .font(Font.system(size: 25))
            .fontWeight(Font.Weight.bold)
    }
}

