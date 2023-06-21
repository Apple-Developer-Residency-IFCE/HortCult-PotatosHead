//
//  HeaderMenu.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 25/05/23.
//

import SwiftUI

struct HeaderMenu: View {
    @ObservedObject var plantViewModel: PlantViewModel
    
    var body: some View {
        NavigationView{
            VStack{
                HStack {
                    Text("Minha Horta")
                        .font(.system(size: 16))
                        .bold()
                        .foregroundColor(Color("MainColor"))
                    Spacer()
                    NavigationLink{ AddInfoScreen(plantViewModel: plantViewModel, isEdit: false)
                    }label: {
                        HStack{
                            Image(systemName: "plus")
                                .foregroundColor(Color("backgroundColor"))
                        }
                    }
                    .frame(width: 32,height: 32, alignment: .center)
                    .background(Color("MainColor"))
                    .clipShape(Circle())
                }
                .padding(.bottom,10)
                ListHorta(plantViewModel: plantViewModel)
            }
        }
    }
}

struct HeaderMenu_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMenu(plantViewModel: PlantViewModel())
    }
}
