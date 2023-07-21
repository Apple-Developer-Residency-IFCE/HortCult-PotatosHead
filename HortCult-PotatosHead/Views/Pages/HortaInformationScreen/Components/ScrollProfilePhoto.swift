//
//  ScrollProfilePhoto.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 26/05/23.
//
import SwiftUI

struct ScrollProfilePhoto: View {
    var plant: Plant
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(0..<(plant.plant_hortcult_images?.count ?? 0)) { index in
                if(plant.plant_hortcult_images != nil){
                    ZStack {
                        Service.plant.getPlantImages(plant: plant)[index]
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5),
                                                                   Color.black.opacity(0)]), startPoint: .top, endPoint: .center).edgesIgnoringSafeArea(.all).allowsHitTesting(false)
                    }
                }else {
                    ZStack{
                        Image("Tomate")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .tag(index)
                        LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5),
                                                                   Color.black.opacity(0)]), startPoint: .top, endPoint: .center).edgesIgnoringSafeArea(.all).allowsHitTesting(false)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .ignoresSafeArea()
    }
}

