//
//  HeaderMenu.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 25/05/23.
//

import SwiftUI

struct HeaderMenu: View {
    var body: some View {
        VStack(){
            HStack {
                Text("Minha Horta")
                    .font(.custom("Satoshi-Bold", size: 26))
                    .bold()
                    .foregroundColor(Color("MainColor"))
                Spacer()
                Button(action: {})
                {
                    Image(systemName: "plus")
                        .foregroundColor(Color("backgroundColor"))
                        
                }
                .padding(.bottom,10)
                ListHorta()
            }
            .padding(.horizontal)
            .padding(.bottom,10)
            ListHorta()
        }
    }
}

struct HeaderMenu_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMenu()
    }
}
