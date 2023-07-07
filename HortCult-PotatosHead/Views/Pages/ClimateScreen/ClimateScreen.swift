//
//  ClimateScreen.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 06/07/23.
//

import SwiftUI

struct ClimateScreen: View {
    let cityInfo: String
    let dateInfo: String
    
    var body: some View {
        VStack{
            CustomNavBar(hiddenDismissButton: true)
            Spacer().frame(height: 20)
            
            HStack{
                VStack(alignment: .leading){
                    Text("Clima")
                        .foregroundColor(Color("MainColor"))
                        .font(.custom("Satoshi-Bold", size: 24))
                    Spacer().frame(height: 12)
                    
                    HStack{
                        Text(cityInfo)
                            .foregroundColor(Color("MainColor"))
                            .font(.custom("Satoshi-Medium", size: 14))
                        
                        Text(dateInfo)
                            .foregroundColor(Color("MainColor"))
                            .font(.custom("Satoshi-Regular", size: 12))
                    }
                    HStack{
                        TemperatureCard(content: "30ºC")
                        HumidityCard(content: "60%")
                    }
                }
                .padding(.leading, 20)
                Spacer()
            }
            Spacer()
        }
    }
}

struct ClimateScreen_Previews: PreviewProvider {
    static var previews: some View {
        ClimateScreen(cityInfo: "Fortaleza, CE", dateInfo: "Qui, 28 de Fevereiro")
    }
}
