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
    @EnvironmentObject var defaults: Defaults
    var hortCultMain: HortCult_PotatosHeadApp?
    @ObservedObject var plantViewModel: PlantViewModel
    
    var body: some View {
        
        
            
            OnboardingScreen(header: "hortFruitLight",
                             centerImage: "onboardingthreelight",
                             primaryText: "Amplie sua horta com diferentes vegetais",
                             secondaryText: "Adicione fotos e informações como luminosidade, umidade e muito mais.",
                             
                             actionMainButton: {isNextScreenActive = true}, mainButtonType: .two,
                             hidenSecondaryButton: false,
                             actionSecondaryButton: {
                                jumpToInitalScreen = true
                                HortCult_PotatosHeadApp.isFirstLogin = false
            })
            
            .background(
                NavigationLink(destination: OnboardingScreenFour(defaults: defaults, plantViewModel: plantViewModel), isActive: $isNextScreenActive) {EmptyView()})
            .background(
                NavigationLink(destination: MainView(defaults: _defaults, plantViewModel: plantViewModel), isActive: $jumpToInitalScreen) { EmptyView()}
            )
            
            //Navegar para a tela inicial no botao 2
            
        //.navigationBarHidden(true)
    }
}

struct OnboardingScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OnboardingScreenThree(plantViewModel: PlantViewModel())
                .environmentObject(Defaults())
        }
    }
}
