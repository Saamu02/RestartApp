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
            Text("HomeView")
                .font(.title)
            
            Button(action: {
                isOnboaringViewActive = true
                
            }, label: {
                Text("Restart")
            })
        }
    }
}

#Preview {
    HomeView()
}
