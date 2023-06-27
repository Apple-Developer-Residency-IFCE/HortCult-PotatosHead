//
//  ButtonHorta.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 20/06/23.
//

import SwiftUI

enum buttonHortaCases: CaseIterable {
    
    case one
    case two
    
}

struct ButtonHorta: View {
    var buttonTipe: buttonHortaCases
    var action: (() -> Void)
    @ObservedObject var plantViewModel: PlantViewModel
    var plant: Plant
    
    var body: some View {
        
        Button(action: {
            action()
        }) {
            switch buttonTipe {
                
            case .one:
                NavigationLink {
                    EditInfoView(plantViewModel: plantViewModel, plant: plant)
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("MainColor"), lineWidth: 2)
                            .frame(width: 277, height: 42)
                        
                        HStack {
                            Image("Edit")
                                .renderingMode(.template)
                                .foregroundColor(Color("MainColor"))
                            Text("Editar informações")
                                .font(.custom("Satoshi-Bold", size: 16))
                                .foregroundColor(Color("MainColor"))
                            
                        }
                    }
                }
                
            case .two:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 277, height: 42)
                        .foregroundColor(Color("red"))
                    
                    HStack {
                        Image("Trash")
                            .renderingMode(.template)
                            .foregroundColor(Color("backgroundColor"))
                        Text("Excluir da Minha Horta")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("backgroundColor"))
                    }
                }
            }
        }
    }
}

