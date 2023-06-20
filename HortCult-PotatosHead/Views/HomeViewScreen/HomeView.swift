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
//    var header: some View {
//        ZStack{
//
//
//            HStack{
//                Button(action: {
//                    self.presentationMode.wrappedValue.dismiss()
//                } ) {
//                    Image("leftArrow")
//                        .opacity(0.0)
//                }
//                .disabled(true)
//                .padding(.leading, 12)
//
//                Rectangle()
//                    .frame(width: 400,height: 150)
//                    .padding(.bottom, 10)
//
//                Spacer()
//            }
//        }
//    }
    
    var body: some View {
            
            VStack {
                
                CustomNavBar(action: {self.presentationMode.wrappedValue.dismiss()}, hiddenDismissButton: true)
                    Spacer()
                
                HeaderMenu(plantViewModel: plantViewModel)
                   
                   .padding(.bottom, 20)
                
                CardListView(cards: [
                    CardViewModel(title: "Batatão está com sede!", content: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular"),
                    CardViewModel(title: "Tomatinho está com sede!", content: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
                ])
            }
           
            .navigationBarBackButtonHidden(true)
            .navigationTitle("")
//            .navigationBarItems(leading: header)
            
        }
        
        
    }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(plantViewModel: PlantViewModel())
            .environmentObject(Defaults())
    }
}
