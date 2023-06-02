//
//  ThemeSelect.swift
//  HortCult-PotatosHead
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct ThemeSelect: View {
    @State private var selectedOption: String = ""

        var body: some View {
            VStack {
                HStack{
                    Text("Ajustes")
                        .font(.custom("Satoshi-Bold", size: 28))
                        .foregroundColor(Color("MainColor"))
                        .padding(.top, 20)
                    Spacer()
                }.padding(.bottom, 40).padding(.top, 40)
                
                
                RadioButton(selectedOption: $selectedOption, title: "Claro").padding(.bottom, 16)
                RadioButton(selectedOption: $selectedOption, title: "Escuro").padding(.bottom, 16)
                RadioButton(selectedOption: $selectedOption, title: "Padrão do Sistema").padding(.bottom, 16)

                Spacer()
            }.padding(.leading, 24)
            
        }
}

struct ThemeSelect_Previews: PreviewProvider {
    static var previews: some View {
        ThemeSelect()
    }
}
