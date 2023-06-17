//
//  AddButton.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 16/06/23.
//

import SwiftUI

struct AddButton: View {
    @Binding var isDisabled: Bool
    
    var body: some View {
        ZStack {
            Button(action: {
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 350, height: 42)
                        .foregroundColor(Color("buttonAdd"))
                    
                    HStack {
                        Text("Adicionar Novo Vegetal")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("backgroundColor"))
                    }
                }
            }
        
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(isDisabled: .constant(true))
    }
}
