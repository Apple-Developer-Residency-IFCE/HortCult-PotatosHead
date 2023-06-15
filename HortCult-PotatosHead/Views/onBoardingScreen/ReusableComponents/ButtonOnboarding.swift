//
//  ButtonView.swift
//  testeComponentes
//
//  Created by userext on 24/05/23.
//

import SwiftUI

enum buttonCases: CaseIterable {
    
    case one
    case two
    case three
    case four
    case five
    
}

struct ReusableButton: View {
    var buttonTipe: buttonCases
    var action: (() -> Void)
    
    var body: some View {
        
        Button(action: {
            action()
        }) {
            switch buttonTipe {
                
            case .one:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 277, height: 42)
                        .foregroundColor(Color("MainColor"))
                    Text("Iniciar")
                        .font(.custom("Satoshi-Bold", size: 16))
                        .foregroundColor(Color("backgroundColor"))
                }
                
            case .two:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color("MainColor"), lineWidth: 1)
                        .frame(width: 277, height: 42)
                    
                    HStack{
                        Text("Continuar")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("MainColor"))
                        Image("Arrow-Right")
                            .renderingMode(.template)
                            .foregroundColor(Color("MainColor"))
                    }
                }
                
            case .three:
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 277, height: 42)
                        .foregroundColor(Color("MainColor"))
                    
                    HStack {
                        Text("Ir para a Tela Inicial")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("backgroundColor"))
                        
                        Image("Arrow-Right")
                            .renderingMode(.template)
                            .foregroundColor(Color("backgroundColor"))
                    }
                }
            case .four:
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

            case .five:
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
        }
    }
    
    struct ButtonView_Previews: PreviewProvider {
        static var previews: some View {
            ReusableButton(buttonTipe: .five, action: {print("ola")})
        }
    }
    
}
