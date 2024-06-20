//
//  CircleGroupView.swift
//  Restart
//
//  Created by Ussama Irfan on 20/06/2024.
//

import SwiftUI

struct CircleGroupView: View {
    
    @State var shapeColor: Color
    @State var shapeOpactity: Double
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpactity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            
            Circle()
                .stroke(shapeColor.opacity(shapeOpactity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
    }
}

#Preview {
    
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)
    }
}
