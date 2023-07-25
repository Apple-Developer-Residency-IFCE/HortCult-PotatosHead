//
//  HortaType.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 01/06/23.
//

import SwiftUI

struct HortaType: View {
    var type: String
    var body: some View {
        ZStack {
            Color.clear
                .frame(width: 26, height: 16)
            Text(type)
                .font(.custom("Satoshi-Regular", size: 12))
                .padding(6)
                .foregroundColor(.gray)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color("buttonCardColor"), lineWidth: 1)
                        .scaleEffect(1.0)
                )
        }
    }
}

struct HortaType_Previews: PreviewProvider {
    static var previews: some View {
        HortaType(type: "Hortaliça")
    }
}
