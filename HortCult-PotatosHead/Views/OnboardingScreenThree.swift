//
//  OnboardingScreenThree.swift
//  HortCult-PotatosHead
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct OnboardingScreenThree: View {
    
    @State private var isNextScreenActive = false
    @State private var jumpToInitalScreen = false
    
    var body: some View {
        
        NavigationView {
            
            OnboardingScreen(header: "hortFruitLight",
                             centerImage: "pana", primaryText: "Amplie sua horta com diferentes vegetais",
                             secondaryText: "Adicione fotos e informações como luminosidade, umidade e muito mais.",
                             bgColorMainButton: false,
                             iconMainButton: true,
                             titleMainButton: "Continuar",
                             actionMainButton: {isNextScreenActive = true},
                             hidenSecondaryButton: false,
                             actionSecondaryButton: {print("ola")})
            
            .background(NavigationLink(destination: OnboardingScreenFour(), isActive: $isNextScreenActive) {EmptyView()})
            
            //Navegar para a tela inicial no botao 2
            
        }.navigationBarHidden(true)
        
        
        
    }
    
    
    
}

struct OnboardingScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenThree()
    }
}
