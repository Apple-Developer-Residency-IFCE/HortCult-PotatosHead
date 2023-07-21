//
//  HumidityCard.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 21/07/23.
//

import SwiftUI

struct HumidityCard: View {
     let title: String = "Umidade"
     let content: String
     let backgroudCardColor: String = "HumidityCardColor"
     let textColor: String = "HumidityTextColor"
     let titleFont: String = "Satoshi-Italic"
     let contentFont: String = "Satoshi-Bold"

     var body: some View {
         HStack {
             VStack(alignment: .leading, spacing: 3) {
                 HStack(alignment: .center, spacing: 7) {
                     Image("Umidade-Icon")
                         .resizable()
                         .frame(width: 17, height: 17)
                         .foregroundColor(Color("HumidityTextColor"))
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

 struct HumidityCard_Previews: PreviewProvider {
     static var previews: some View {
         HumidityCard(content: "60%")
     }
 }
