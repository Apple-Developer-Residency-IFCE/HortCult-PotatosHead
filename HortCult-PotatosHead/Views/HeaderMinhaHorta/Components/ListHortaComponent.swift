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
//                    plantViewModel.plants.forEach { Plant in
//                        NavigationLink {
//                            HortaInformation()
//                        } label: {
//                            HortaComponent(imagePath: "Tomate", nameHorta: Plant.name!)
//                        }
//                    }
                    ForEach(0..<5){_ in
                        NavigationLink {
                            HortaInformation()
                        } label: {
                            HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
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
