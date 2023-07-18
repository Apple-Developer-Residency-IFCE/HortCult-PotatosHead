//
//  OnboardingScreen.swift
//  HortCult-PotatosHead
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct OnboardingScreen: View {
//Tela
    var header: String
    var centerImage: String?
    var primaryText: String
    var secondaryText: String
//Primeiro botao
    var actionMainButton: (() -> Void)
    var mainButtonType: ButtonCases
//Segundo botao
    var hidenSecondaryButton: Bool
    var actionSecondaryButton: (() -> Void)?
    var body: some View {
        VStack {
            Image(header)
                .padding(.top, 20)
                .padding(.horizontal, 108)
            if let cImage = centerImage {
                Image(cImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 57)
                    .padding(.top, 39.62)
                    .padding(.bottom, 34.24)
                Text(primaryText)
                    .foregroundColor(Color("MainColor"))
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                    .font(.custom("Satoshi-Medium", size: 24))
                    .multilineTextAlignment(.center)
                Text(secondaryText)
                    .padding(.horizontal, 47)
                    .padding(.bottom, 80)
                    .multilineTextAlignment(.center)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("secondaryColor"))
                    .layoutPriority(1.0)
                ReusableButton(buttonTipe: mainButtonType , action: {actionMainButton()})
                        .padding(.bottom, 25)
                    Button("Pular para a tela inicial") {
                        if let secondButtonAction = actionSecondaryButton {
                            secondButtonAction()
                        } else {
                            return
                        }
                    }.padding(.bottom, 64)
                        .foregroundColor(Color("secondaryColor"))
                        .font(.custom("Satoshi-Medium", size: 16))
                        .opacity(hidenSecondaryButton ? 0 : 1)
                        .disabled(hidenSecondaryButton ? true : false)
            } else {
                
                Spacer()
                
                Text(primaryText)
                    .foregroundColor(Color("MainColor"))
                    .padding(.bottom, 12)
                    .padding(.horizontal)
                    .font(.custom("Satoshi-Bold", size: 28))
                    .multilineTextAlignment(.center)
                
                Text(secondaryText)
                    .padding(.horizontal, 47)
                    .padding(.bottom, 211)
                    .multilineTextAlignment(.center)
                    .font(.custom("Satoshi-Regular", size: 16))
                    .foregroundColor(Color("secondaryColor"))
                
                ReusableButton(buttonTipe: mainButtonType , action: {actionMainButton()})
                    .padding(.bottom, 25)
                
                Button("Pular para a tela inicial") {
                    if let secondButtonAction = actionSecondaryButton {
                    } else {
                        return
                    }
                    
                }.padding(.bottom, 64)
                    .foregroundColor(Color("secondaryColor"))
                    .font(.custom("Satoshi-Medium", size: 16))
                    .opacity(hidenSecondaryButton ? 0 : 1)
                    .disabled(hidenSecondaryButton ? true : false)
                    
            }
        }
    }
}





struct OnboardingSkull_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen(header: "hortFruitLight",centerImage: "amico 2", primaryText: "Boas Vindas!", secondaryText: "Com o HortCult, voce pode acompanhar a sua horta domestica de forma simples e facil.",actionMainButton: {print("ola")}, mainButtonType: .one, hidenSecondaryButton: true, actionSecondaryButton: {print("Segundo botao")})
    }
}
