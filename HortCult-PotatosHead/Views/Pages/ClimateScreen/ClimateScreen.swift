//
//  ClimateScreen.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 24/07/23.
//

import SwiftUI

 struct ClimateScreen: View {
     let cityInfo: String
     let dateInfo: String

     var body: some View {
         VStack {
             CustomNavBar(hiddenDismissButton: true)
             HStack {
                 VStack(alignment: .leading, spacing: 20) {
                     Text("Clima")
                         .foregroundColor(Color("MainColor"))
                         .font(.custom("Satoshi-Bold", size: 24))
                     HStack {
                         Text(cityInfo)
                             .foregroundColor(Color("MainColor"))
                             .font(.custom("Satoshi-Medium", size: 14))
                         Text(dateInfo)
                             .foregroundColor(Color("MainColor"))
                             .font(.custom("Satoshi-Regular", size: 12))
                     }
                     HStack {
                         TemperatureCard(content: "30ºC")
                         HumidityCard(content: "60%")
                     }
                 }
                 .padding()
                 Spacer()
             }
             Spacer()
         }
         .ignoresSafeArea(.all, edges: .top)
     }
 }

 struct ClimateScreen_Previews: PreviewProvider {
     static var previews: some View {
         ClimateScreen(cityInfo: "Fortaleza, CE", dateInfo: "Qui, 28 de Fevereiro")
     }
 }
