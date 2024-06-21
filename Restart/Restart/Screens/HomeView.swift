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
    
    @State private var isAnimating = false
    
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
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
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
        .onAppear(perform: {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                isAnimating = true
            })
        })
    }
}

#Preview {
    HomeView()
}
