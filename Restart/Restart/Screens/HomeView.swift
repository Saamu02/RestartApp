//
//  HomeView.swift
//  Restart
//
//  Created by Ussama Irfan on 19/06/2024.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: PROPERTIES
    
    @AppStorage("onboarding") var isOnboaringViewActive = false
    
    // MARK: BODY
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            
            // MARK: HEADER
            
            Spacer()
            
            ZStack {
                
                CircleGroupView(shapeColor: .gray, shapeOpactity: 0.1)

                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
         
            
            // MARK: CENTER
            
            Text("The time that lead to mastery is dependent to the intensity of our focuse")
                .font(.title3)
                .fontWeight(.light)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            
            // MARK: FOOTER
            
            Spacer()
            
            Button(action: {
                isOnboaringViewActive = true

            }, label: {
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            })
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
    }
}

#Preview {
    HomeView()
}
