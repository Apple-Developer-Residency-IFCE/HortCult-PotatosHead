//
//  HortaInformation.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 29/05/23.
//

import SwiftUI


struct HortaInformation: View {
    var titulo = "Tomatinho"
    var descricao = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
    var frequencia_de_rega = "diaria"
    var proxima_rega = "2019-10-10"
    var tipo = "Hortaliças"
    
    var body: some View {
        HStack {
            Text(titulo)
                .font(.system(size: 28))
                .foregroundColor(Color("MainColor"))
                .bold()
            
        }
    }
}

struct HortaInformation_Previews: PreviewProvider {
    static var previews: some View {
        HortaInformation()
    }
}
