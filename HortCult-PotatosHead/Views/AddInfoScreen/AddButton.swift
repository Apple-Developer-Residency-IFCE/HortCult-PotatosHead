//
//  AddButton.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 16/06/23.
//

import SwiftUI

struct AddButton: View {
    var isDisabled: Bool
    var action: () -> Void
    var isEdit: Bool = false
    
    var body: some View {
        ZStack {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 350, height: 42)
                        .foregroundColor(isDisabled ? Color("buttonAdd") : Color("MainColor"))
                    
                    HStack {
                        Text(!isEdit ? "Adicionar Novo Vegetal" : "Atualizar Vegetal")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("backgroundColor"))
                    }
                }
            }
            .disabled(isDisabled)
        }
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(isDisabled: false){}
    }
}

