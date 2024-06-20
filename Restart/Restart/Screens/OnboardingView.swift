//
//  OnboardingView.swift
//  Restart
//
//  Created by Ussama Irfan on 19/06/2024.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: PROPERTIES
    @AppStorage("onboarding") var isOnboaringViewActive = true
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                // MARK: HEADER
                Spacer()
                
                VStack(spacing: 0) {
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("""
              It's not how much we give but
              how much love we put into giving.
              """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                
                
                // MARK: CENTER
                ZStack {
                    
                    ZStack {
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260, height: 260, alignment: .center)
                        
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 80)
                            .frame(width: 260, height: 260, alignment: .center)
                    }
                
                    Image("character-1")
                      .resizable()
                      .scaledToFit()
                }
                
                Spacer()
                
                // MARK: FOOTER
                ZStack {
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                      .font(.system(.title3, design: .rounded))
                      .fontWeight(.bold)
                      .foregroundColor(.white)
                      .offset(x: 20)

                    
                    HStack {
                        
                        Capsule()
                            .fill(Color.customRed)
                            .frame(width: 80)
                        
                        Spacer()
                    }
                    
                    HStack {
                        
                        ZStack {
                            
                            Circle()
                                .fill(Color.customRed)
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding()
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundStyle(.white)
                        
                        Spacer()
                    }
                }
                .frame(height: 80, alignment: .center)
                .padding()
                .onTapGesture {
                    isOnboaringViewActive = false
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
