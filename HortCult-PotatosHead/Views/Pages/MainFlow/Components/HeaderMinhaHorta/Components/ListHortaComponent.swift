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
    var body: some View {
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    ForEach(Service.plant.plants){ plant in
                        NavigationLink {
                            HortaInformationScreen(plant: plant )
                        } label: {
                            if let image = Service.plant.getPlantImages(plant: plant).first {
                                HortaComponent( nameHorta: plant.name!, plant: plant, image: image)
                            }
                            
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
        ListHorta()
    }
}
