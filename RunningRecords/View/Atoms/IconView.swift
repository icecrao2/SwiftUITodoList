//
//  Icon.swift
//  RunningRecords
//
//  Created by sw on 2022/12/17.
//

import SwiftUI



protocol IconViewProtocol {
    
    var logoText: String {get set}
    
    var radius: CGFloat {get set}
    var fontSize: CGFloat {get set}
    
    var duration: CGFloat {get set}
    
    var backgroundColor: Color {get set}
    
    var isStart: Bool {get set}
    func onAnimation() -> Void
}


extension IconViewProtocol where Self: View {
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: isStart ? 1 : 0)
                .fill(backgroundColor)
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: duration), value: isStart)
                .frame(width: radius)
                .onAppear{
                    onAnimation()
                }
            
            Text(logoText)
                .font(Font.system(size: fontSize))
        }
    }
}


struct BigIconView: View, IconViewProtocol {
    
    var logoText: String = "🗓"
    
    var radius: CGFloat = 300
    var fontSize: CGFloat = 120
    
    var duration: CGFloat = 1
    
    var backgroundColor: Color = .blue
    
    @State var isStart: Bool = false
    
    func onAnimation() {
        isStart = true
    }
}

struct SmallIconView: View, IconViewProtocol {
    var logoText: String = "🗓"
    
    var radius: CGFloat = 80
    var fontSize: CGFloat = 40
    
    var duration: CGFloat = 1
    
    var backgroundColor: Color = .blue
    
    @State var isStart: Bool = true
    
    func onAnimation() {
        
    }
}



struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        SmallIconView()
    }
}
