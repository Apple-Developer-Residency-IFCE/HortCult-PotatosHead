//
//  OnboardingScreenFour.swift
//  HortCult-PotatosHead
//
//  Created by userext on 26/05/23.
//

import SwiftUI

struct OnboardingScreenFour: View {
    
    @State var isNextScreenActive = false
    
    var body: some View {
        
        
        NavigationView {
            
            OnboardingScreen(header: "hortFruitLight",
                             centerImage: "pana 2",
                             primaryText: "Hora de Cuidar",
                             secondaryText: "Receba lembretes para regar e adubar suas plantas na frequência certa.",
                             bgColorMainButton: true,
                             iconMainButton: true,
                             titleMainButton: "Ir para a Tela Inicial",
                             actionMainButton: {
                                isNextScreenActive = true
                                HortCult_PotatosHeadApp.isFirstLogin = false
                            },
                             hidenSecondaryButton: true)
            
            
            //Navegar para tela inicial no botao 1
            
        }.navigationBarHidden(true)
    }
}

struct OnboardingScreenFour_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenFour()
    }
}
