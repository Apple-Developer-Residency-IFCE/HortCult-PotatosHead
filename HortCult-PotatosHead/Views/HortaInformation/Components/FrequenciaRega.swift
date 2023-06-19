//
//  FrequenciaRega.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 01/06/23.
//

import SwiftUI

var frequencias:[Int:String] = [
    1: "Todos os Dias",
    2: "A cada Dois Dias",
    3: "A cada Três Dias",
    4: "A cada Quatro dias",
    5: "A cada Cinco dias",
    6: "A cada Seis Dias",
    7: "Semanalmente",
    14: "A cada Duas Semamanas",
    30: "Mensalmente"
]

struct FrequenciaRega: View {
    var frequencia:Int
    var body: some View {
        VStack(alignment: .leading){
            Text("Frêquencia de Rega")
                .font(.custom("Satoshi-Regular", size: 16))
                .padding(.bottom, 1)
            Text(frequencias[frequencia]!)
                .font(.custom("Satoshi-Regular", size: 18))
                .bold()
        }
    }
}

struct FrequenciaRega_Previews: PreviewProvider {
    static var previews: some View {
        FrequenciaRega(frequencia: 1)
    }
}
