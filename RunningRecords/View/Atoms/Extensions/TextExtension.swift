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
            .font(Font.callout)
            .fontWeight(Font.Weight.medium)
    }
    
    func customTitleText() -> Text {
        self
            .foregroundColor(.black)
            .font(.largeTitle)
            .fontWeight(Font.Weight.heavy)
    }
}
