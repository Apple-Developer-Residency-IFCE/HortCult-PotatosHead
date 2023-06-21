//
//  HortaInformation.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 29/05/23.
//

import SwiftUI


struct HortaInformation: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var plantViewModel: PlantViewModel
    var plant: Plant
    //var descricao = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
    //var frequencia_de_rega = "diaria"
    //var proxima_rega = "2019-10-10"
    //var tipo = "Hortaliças"

    var header: some View {
        ZStack {
            VStack{
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Arrow-Left-White")
                        Text("Voltar").foregroundColor(Color(.white)).font(.custom("Satoshi-Regular", size: 16))
                    }
                    .padding(.leading,12).padding(.trailing,-8)
                }
            }
        }
    }
    
    var body: some View {
        NavigationView(){
            ScrollView(.vertical){
                ScrollProfilePhoto()
                    .frame(minWidth: 390, minHeight: 390)
                    .ignoresSafeArea()
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        Spacer()
                        HStack {
                            Text(plant.name ?? "NAO TEM NOME")
                                .font(.custom("Satoshi-Regular", size: 28))
                                .foregroundColor(Color("MainColor"))
                                .bold()
                            Spacer()
                            HortaType(type: plant.category ?? "NAO TEM CATEGORIA")
                        }
                        .padding(.bottom,24)
                        Text(plant.information ?? "NAO TEM INFO")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .padding(.bottom,24)
                        CardProximaRega(title: "Próxima rega:", content: "12/05", icon: "Water-Blue", cardColor: "blueReminderIcon", backgroudCardColor: "BlueAlertCard", textColor: "TextColor", titleFont: "Satoshi-Regular", contentFont: "Satoshi-Bold")
                            .padding(.bottom,24)
                        if let freq = plant.watering_frequency {
                            FrequenciaRega(plantViewModel: plantViewModel, frequencia: freq)
                                .padding(.horizontal)
                        } else {
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                VStack(alignment: .center){
                    
                    ButtonHorta(buttonTipe: .one, action: {print("ola")}, plantViewModel: plantViewModel, plant: plant)
                    ButtonHorta(buttonTipe: .two, action: {
                        self.presentationMode.wrappedValue.dismiss()
                        plantViewModel.deletePlant(plant: plant)
                    }, plantViewModel: plantViewModel, plant: plant)
                }
                Spacer(minLength: 40)
            }
            .overlay {
                LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: UnitPoint(x: 0.5, y: 0.35))
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: .infinity,height: .infinity)
                    .allowsHitTesting(false)
            }
            .edgesIgnoringSafeArea(.top)
        }
        .frame(height: .infinity)
        .edgesIgnoringSafeArea(.top)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: header)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}
