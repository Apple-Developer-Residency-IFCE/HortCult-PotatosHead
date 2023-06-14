//
//  HortaInformation.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 29/05/23.
//

import SwiftUI


struct HortaInformation: View {
    var titulo = "Tomatinho"
    var descricao = "O tomate é um fruto rico em vitamina C, vitamina A, vitamina K e licopeno, que é um potente antioxidante, ajudando a manter a saúde da pele, fortalecer o sistema imunológico e evitar doenças cardiovasculares, como infarto e aterosclerose."
    var frequencia_de_rega = "diaria"
    var proxima_rega = "2019-10-10"
    var tipo = "Hortaliças"
    @Environment(\.presentationMode) var presentationMode

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
                            Text(titulo)
                                .font(.custom("Satoshi-Regular", size: 28))
                                .foregroundColor(Color("MainColor"))
                                .bold()
                            Spacer()
                            HortaType(type: tipo)
                        }
                        .padding(.bottom,24)
                        Text(descricao)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .padding(.bottom,24)
                        CardProximaRega(title: "Próxima rega:", content: "12/05", icon: "Water-Blue", cardColor: "blueReminderIcon", backgroudCardColor: "BlueAlertCard", textColor: "TextColor", titleFont: "Satoshi-Regular", contentFont: "Satoshi-Bold")
                            .padding(.bottom,24)
                        FrequenciaRega(frequencia: 1)
                        .padding(.horizontal)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                VStack(alignment: .center)
                {
                    ReusableButton(buttonTipe: .five, action: {print("ola")})
                    ReusableButton(buttonTipe: .four, action: {print("ola")})
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

struct HortaInformation_Previews: PreviewProvider {
    static var previews: some View {
        HortaInformation()
    }
}
