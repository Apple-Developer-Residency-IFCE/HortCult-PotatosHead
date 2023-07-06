//
//  ClimateCard.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 06/07/23.
//

import SwiftUI

import SwiftUI

struct ClimateCard: View {
    let title: String = "Umidade"
    let content: String
    let icon: String = "Water-Blue"
    let cardColor: String = "BlueAlertCard"
    let backgroudCardColor: String = "HumidityCardColor"
    let textColor: String = "HumidityTextColor"
    let titleFont: String = "Satoshi-Italic"
    let contentFont: String = "Satoshi-Bold"
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 3){
                HStack(alignment: .center, spacing: 2){
                    Image("Umidade-Icon").foregroundColor(Color("HumidityTextColor"))
                    Text(title)
                        .font(.custom(titleFont, size: 11))
                }
                Text(content)
                    .font(.custom(contentFont, size: 20.97))
                    .padding(.leading, 5)
            }
            .foregroundColor(Color(textColor))
            .padding(.leading, 12)
            Spacer()
        }
        .frame(width: 125,height: 65)
        .background(
            Color(backgroudCardColor)
        )
        .cornerRadius(8)
    }
}

struct ClimateCard_Previews: PreviewProvider {
    static var previews: some View {
        ClimateCard(content: "60%")
    }
}
