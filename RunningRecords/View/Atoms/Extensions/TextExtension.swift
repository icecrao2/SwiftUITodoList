//
//  TextExtension.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import Foundation
import SwiftUI

extension Text {
    
    func customListText() -> Text {
        self
            .foregroundColor(.black)
            .font(.callout)
            .fontWeight(Font.Weight.medium)
    }
    
    func customTitleText() -> Text {
        self
            .font(.largeTitle)
            .fontWeight(Font.Weight.heavy)
    }
    
    func customLabelText() -> Text {
        self
            .foregroundColor(.black)
            .font(.title2)
            .fontWeight(Font.Weight.heavy)
    }
    
    func customDefaultText() -> Text {
        
        self
            .foregroundColor(.black)
            .font(.callout)
            .fontWeight(Font.Weight.bold)
        
    }
    
    func customButtonText() -> some View {
        self
            .foregroundColor(.white)
            .font(.title2)
            .fontWeight(Font.Weight.heavy)
            .frame(maxWidth:.infinity)
            .frame(height: 50)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.blue)
            )
            .padding()
    }
}
