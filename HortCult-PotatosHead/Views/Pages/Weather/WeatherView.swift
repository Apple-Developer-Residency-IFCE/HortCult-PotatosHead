//
//  WeatherView.swift
//  HortCult-PotatosHead
//
//  Created by João Vitor Alves Holanda on 05/07/23.
//

import SwiftUI


struct WeatherView: View {
    
    var weather: ResponseBody

    var body: some View {
        
        //aqui a tela de clima depois da permissao
        ScrollView(.vertical){
            ZStack(alignment: .leading) {
                VStack {
                    HStack {
                        //Localizacao sem sigla do estado
                        Text("\(weather.name), CE")
                   
                        //Data
                        Text("\(Date().formatted(.dateTime.weekday()).capitalized.trimmingCharacters(in: .punctuationCharacters)),  \(Date().formatted(.dateTime.month(.wide).day()))")

                    }

                    .padding(.top, 100)
                    VStack(alignment: .leading) {
                        Text("Temperatura " + weather.main.temp.roundDouble() + "°")
                        Text("Humidade " + weather.main.humidity.roundDouble() + "%")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }

        }

    }
}

//struct WeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherView(weather: previewWeather)
//    }
//}
