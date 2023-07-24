//
//  TemperatureCard.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 24/07/23.
//

import SwiftUI

struct TemperatureCard: View {
     let title: String = "Temperatura"
     let content: String
     let backgroudCardColor: String = "TemperatureCardColor"
     let textColor: String = "TemperatureTextColor"
     let titleFont: String = "Satoshi-Italic"
     let contentFont: String = "Satoshi-Bold"

     var body: some View {
         HStack {
             VStack(alignment: .leading, spacing: 3) {
                 HStack(alignment: .center, spacing: 7) {
                     Image("Sun-Icon")
                         .resizable()
                         .frame(width: 17, height: 17)
                         .foregroundColor(Color("TemperatureTextColor"))
                     Text(title)
                         .font(.custom(titleFont, size: 11))
                 }
                 Text(content)
                     .font(.custom(contentFont, size: 20.97))
                     .padding(.leading, 2)
             }
             .foregroundColor(Color(textColor))
             .padding(.leading, 12)
             Spacer()
         }
         .frame(width: 125, height: 65)
         .background(
             Color(backgroudCardColor)
         )
         .cornerRadius(8)
     }
 }

 struct TemperatureCard_Previews: PreviewProvider {
     static var previews: some View {
         TemperatureCard(content: "30ºC")
     }
 }
