//
//  EditButton.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 21/06/23.
//

import SwiftUI

struct EditButton: View {
    var isDisabled: Bool
    var action: () -> Void
    
    var body: some View {
        ZStack {
            Button(action: action) {
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 350, height: 42)
                        .foregroundColor(isDisabled ? Color("buttonAdd") : Color("MainColor"))
                    
                    HStack {
                        Text("Atualizar Vegetal")
                            .font(.custom("Satoshi-Bold", size: 16))
                            .foregroundColor(Color("backgroundColor"))
                    }
                }
            }
            .disabled(isDisabled)
        }
        .padding(.bottom, 50)
    }
}

struct EditButton_Previews: PreviewProvider {
    static var previews: some View {
        EditButton(isDisabled: false){}
    }
}
