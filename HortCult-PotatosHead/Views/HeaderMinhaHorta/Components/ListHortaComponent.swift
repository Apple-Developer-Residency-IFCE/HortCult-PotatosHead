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
    var body: some View {
        NavigationView{
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    NavigationLink {
                        DescriptionHorta()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }
                    NavigationLink {
                        DescriptionHorta()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }

                    NavigationLink {
                        DescriptionHorta()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }
                }
                .foregroundColor(Color("title"))
            }
        }
        .frame(height: 170)
    }
}

struct ListHorta_Previews: PreviewProvider {
    static var previews: some View {
        ListHorta()
    }
}
