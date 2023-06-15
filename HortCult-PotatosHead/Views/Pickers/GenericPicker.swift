//
//  GenericPicker.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 14/06/23.
//

import SwiftUI

struct GenericPicker: View {
    
    
    
    var colors = ["Hortaliças", "Legumes", "Pimentas", "Medicinais", "Temperos"]
    @State private var selectedColor = "Red"
    var body: some View {
        
        VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(Color("hourButton"), lineWidth: 1)
                    HStack {
                        Text("Selecionar...")
                            .font(.custom("Satoshi-Regular", size: 12))
                            .padding(.horizontal)
                            .foregroundColor(Color("navBarColor"))
                        
                        Spacer()
                        
                        Image("Dropdown")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 15, height: 15)
                            .padding(.horizontal)
                            .foregroundColor(Color("TextColor"))
                    }
                }
                .frame(width: 350, height: 35)
        }
        
    }
    
    
    //            VStack {
    //
    //                    Picker("Please choose a color", selection: $selectedColor) {
    //                        ForEach(colors, id: \.self) {
    //                            Text($0)
    //                        }
    //
    //                    }
    //                    .pickerStyle(.wheel)
    //                    Text("You selected: \(selectedColor)")
    //
    //
    //            }
}


struct GenericPicker_Previews: PreviewProvider {
    static var previews: some View {
        GenericPicker()
    }
}
