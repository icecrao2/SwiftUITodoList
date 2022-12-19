//
//  LabelTextField.swift
//  RunningRecords
//
//  Created by sw on 2022/12/19.
//

import SwiftUI

struct LabelTextField: View {
    
    @Binding var inputedText: String
    
    var labelText: String = "Label"
    var placeholderText: String = "Placeholder"
    
    var body: some View {
        
        VStack(alignment: .leading){
            Text(labelText)
                .customLabelText()
            
            Spacer(minLength: 0).frame(height:10)
            
            TextField(placeholderText, text: $inputedText)
                .customDefaultTExtField()
        }
    }
}

struct LabelTextField_Previews: PreviewProvider {
    static var previews: some View {
        LabelTextField(inputedText: .constant(""))
    }
}
