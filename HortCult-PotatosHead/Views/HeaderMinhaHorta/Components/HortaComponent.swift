//
//  HortaComponent.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 24/05/23.
//

import SwiftUI

struct HortaComponent: View {
    var imagePath : String
    var nameHorta : String
    
    var body: some View {
        VStack(alignment: .center)
        {
            Image(imagePath)
                .resizable()
                .frame(width: 140, height: 110)
                .aspectRatio(contentMode: .fill)
                .offset(y: -8)
            VStack(alignment: .center){
                Text(nameHorta)
                    .font(.system(size: 16))
                    .bold()
                    .offset(y:-5)
                    .frame(maxWidth: 120)
            }
        }
        .frame(width: 140, height: 150)
        .background(Color("BackgroundComponent"))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct HortaComponent_Previews: PreviewProvider {
    static var previews: some View {
        HortaComponent(imagePath: "Tomate", nameHorta:"Tomate")
    }
}
