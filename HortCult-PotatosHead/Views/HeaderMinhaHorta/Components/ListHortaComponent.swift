//
//  ListHorta.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 24/05/23.
//

import SwiftUI

struct Horta {
    var nome : String
    var imagePath : String
}

struct ListHorta: View {

    @Environment(\.presentationMode) var presentationMode
//
//    @ViewBuilder var content: () -> Content
    
    var body: some View {
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(0..<5){_ in
                        NavigationLink {
                            ScrollView(.vertical){
                                VStack{
                                    ScrollProfilePhoto()
                                        .frame(minWidth: 390, minHeight: 390)
                                        .overlay {
                                            LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .center)
                                                .edgesIgnoringSafeArea(.all)
                                                .frame(width: .infinity,height: .infinity)
                                        }
                                    HortaInformation()
                                }
                            }
                            .edgesIgnoringSafeArea(.all)
                        } label: {
//                            self.content()
                            HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                        }
                    }
                    .foregroundColor(Color("title"))
                }
                .foregroundColor(Color("title"))
            }.scrollIndicators(.hidden)
        }
        .frame(height: 170)
    }
}

struct ListHorta_Previews: PreviewProvider {
    static var previews: some View {
        ListHorta()
    }
}
