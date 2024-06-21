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
    
    @State private var buttonWidth: Double = (UIScreen.current?.bounds.width)! - 80
    
    @State private var buttonOffset: CGFloat = 0
    
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
                } //: HEADER
                
                
                // MARK: CENTER
                ZStack {
                    
                    CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)

                    Image("character-1")
                      .resizable()
                      .scaledToFit()
                } //: CENTER
                
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
                            .frame(width: buttonOffset + 80)
                        
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    
                                    if (gesture.translation.width > 0) && (buttonOffset <= (buttonWidth - 80)) {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        isOnboaringViewActive = false
                                        
                                    } else {
                                        buttonOffset = 0
                                    }
                                }
                        ) //: GESTURE

                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
            } //: VSTACK
        } //: ZSTACK
    }
}

#Preview {
    OnboardingView()
}
