//
//  ContentView.swift
//  Restart
//
//  Created by Ussama Irfan on 19/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: PROPERTIES
   
    @AppStorage("onboarding") var isOnboaringViewActive = true
    
    // MARK: BODY
    
    var body: some View {
        
        ZStack {
            
            if isOnboaringViewActive {
                OnboardingView()
                
            } else {
                HomeView()
            }
        }
        .animation(.easeOut(duration: 0.5), value: isOnboaringViewActive)
    }
}

#Preview {
    ContentView()
}
