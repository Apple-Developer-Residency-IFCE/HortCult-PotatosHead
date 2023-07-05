//
//  ScrollProfilePhoto.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 26/05/23.
//
import SwiftUI

struct ScrollProfilePhoto: View {
    var plant: Plant
    @EnvironmentObject var plantViewModel: PlantViewModel
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<(plant.plant_hortcult_images?.count ?? 0)) { index in
                plantViewModel.getPlantImages(plant: plant)[index]
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}

