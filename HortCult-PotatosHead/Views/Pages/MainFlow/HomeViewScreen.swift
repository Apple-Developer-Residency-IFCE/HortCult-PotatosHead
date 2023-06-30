//
//  SwiftUIView.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//


import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var defaults: Defaults
    @ObservedObject var plantViewModel: PlantViewModel
    @State var goToAddPlantScreen: Bool = false
    
    var body: some View {
            VStack {
                
                CustomNavBar(hiddenDismissButton: true)
                Spacer()
                
                ScrollView {
                    HeaderMenu(plantViewModel: plantViewModel)
                    
                    Spacer().frame(height: plantViewModel.plants.isEmpty ? 120 : 0)
                    
                    //.padding(.bottom, 20)
                    
                    CardListView(cards: [
                        CardViewModel(title: "Batatão está com sede!", content: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular"),
                        CardViewModel(title: "Tomatinho está com sede!", content: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
                    ])
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
        }
           
    }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(plantViewModel: PlantViewModel())
            .environmentObject(Defaults())
    }
}




