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
    @ObservedObject var plantViewModel: PlantViewModel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(plantViewModel.plants){ plant in
                        NavigationLink {
                            HortaInformationScreen( plantViewModel: plantViewModel, plant: plant )
                        } label: {
                            HortaComponent(imagePath: "Tomate", nameHorta: plant.name!)
                        }
                    }
                    .foregroundColor(Color("title"))
                }
                .foregroundColor(Color("title"))
            }.scrollIndicators(.hidden)
        }
}

struct ListHorta_Previews: PreviewProvider {
    static var previews: some View {
        ListHorta(plantViewModel: PlantViewModel())
    }
}
