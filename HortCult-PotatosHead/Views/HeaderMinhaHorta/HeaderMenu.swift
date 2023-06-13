//
//  HeaderMenu.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 25/05/23.
//

import SwiftUI

struct HeaderMenu: View {
    @State private var isOnInformationPage = false
//    var body: some View {
//        VStack(){
//            HStack {
//                Text("Minha Horta")
//                    .font(.system(size: 16))
//                    .bold()
//                    .foregroundColor(Color("MainColor"))
//                Spacer()
//                Button(action: {})
//                {
//                    Image(systemName: "plus")
//                        .foregroundColor(Color("backgroundColor"))
//                }
//                .frame(width: 32,height: 32, alignment: .center)
//                .background(Color("MainColor"))
//                .clipShape(Circle())
//            }
//            .padding(.bottom,10)
//            ListHorta()
//        }
//    }
    var body: some View {
        NavigationStack {
            NavigationLink {
                VStack{
                    HortaInformation()
                }
            } label: {
                HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
            }
        }
    }
}

struct HeaderMenu_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMenu()
    }
}
