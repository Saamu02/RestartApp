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
    @State private var isAnimating = false
    @State private var imageOffset = CGSize.zero
    @State private var indicatorOpactiy = 1.0
    @State private var textTitle = "Share."
    
    let hapticFeedBack = UINotificationFeedbackGenerator()
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                // MARK: HEADER
                Spacer()
                
                VStack {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                    
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)


                // MARK: CENTER
                ZStack {
                    
                    CircleGroupView(shapeColor: .white, shapeOpactity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)

                    Image("character-1")
                      .resizable()
                      .scaledToFit()
                      .opacity(isAnimating ? 1 : 0)
                      .animation(.easeOut(duration: 0.5), value: isAnimating)
                      .offset(x: imageOffset.width * 1.2, y: 0)
                      .rotationEffect(.degrees(imageOffset.width / 20))
                      .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                
                                if abs(imageOffset.width) <= 150 {
                                    imageOffset = gesture.translation
                                }
                                                                
                                withAnimation(.linear(duration: 0.25)) {
                                    indicatorOpactiy = 0
                                    textTitle = "Give."
                                }
                            }
                            .onEnded {  _ in
                                imageOffset = .zero
                                
                                withAnimation(.linear(duration: 0.25)) {
                                    indicatorOpactiy = 1
                                    textTitle = "Share."
                                }
                            }
                      ) //GESTURE
                      .animation(.easeOut(duration: 1), value: imageOffset )
                } //: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 42, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpactiy)
                    , alignment: .bottom
                )
                
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
                                        hapticFeedBack.notificationOccurred(.success)
                                        AudioPlayer.shared.playSound(sound: SoundConstants.chimeupSound)
                                        buttonOffset = buttonWidth - 80
                                        isOnboaringViewActive = false
                                        
                                    } else {
                                        hapticFeedBack.notificationOccurred(.warning )
                                        buttonOffset = 0
                                    }
                                }
                        ) //: GESTURE

                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VSTACK
        } //: ZSTACK
        .onAppear(perform: {
             isAnimating = true
        })
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
