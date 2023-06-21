//
//  FrequenciaRega.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 01/06/23.
//

import SwiftUI


struct FrequenciaRega: View {
    @ObservedObject var plantViewModel: PlantViewModel
    var frequencia:String
    var body: some View {
        VStack(alignment: .leading){
            Text("Frêquencia de Rega")
                .font(.custom("Satoshi-Regular", size: 16))
                .padding(.bottom, 1)
            Text(frequencia)
                .font(.custom("Satoshi-Regular", size: 18))
                .bold()
        }
    }
}

struct FrequenciaRega_Previews: PreviewProvider {
    static var previews: some View {
        FrequenciaRega(plantViewModel: PlantViewModel(), frequencia: "teste")
    }
}
