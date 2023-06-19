//
//  OnboardingScreenFour.swift
//  HortCult-PotatosHead
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct OnboardingScreenFour: View {
    
    @State var isNextScreenActive = false
    @ObservedObject var defaults: Defaults
    var hortCultMain: HortCult_PotatosHeadApp?

    
    var body: some View {
        
        
        NavigationView {
            
            OnboardingScreen(header: "hortFruitLight",
                             centerImage: "onboardingfourlight",
                             primaryText: "Hora de Cuidar",
                             secondaryText: "Receba lembretes para regar e adubar suas plantas na frequência certa.",
                             actionMainButton: {
                                isNextScreenActive = true
                                HortCult_PotatosHeadApp.isFirstLogin = false
                            },
                             mainButtonType: .three,
                             hidenSecondaryButton: true)
            
            
            .background(NavigationLink(destination: MainView(), isActive: $isNextScreenActive, label: {EmptyView()}))
            
        }.navigationBarHidden(true)
    }
}

struct OnboardingScreenFour_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenFour(defaults: Defaults())
    }
}
