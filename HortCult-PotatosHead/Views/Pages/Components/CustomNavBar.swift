//
//  testeNav.swift
//  HortCult-PotatosHead
//
//  Created by Gabriel Carvalho on 15/06/23.
//

import SwiftUI

struct CustomNavBar: View {
    
    var hortCultMain: HortCult_PotatosHeadApp?
    var action: (() -> Void)
    var hiddenDismissButton: Bool
    
    var body: some View {
       
        VStack{
            
            ZStack {
            
                VStack {
                    Rectangle()
                        .frame(height: 110)
                        .foregroundColor(Color("backgroundnavbarcolor"))
                    
                    Rectangle()
                        .frame(height: 0.6)
                        .foregroundColor(Color.black)
                        
                }
                
                
                    
                
                HStack{
                    
                    Button {
                        action()
                        
                    } label: {
                        Image("leftArrow")
                            .renderingMode(.template)
                            .foregroundColor(Color("navbardismissbuttoncolor"))
                            .padding(.leading, 20)
                          
                    }.padding(.top, 40)
                        .hidden()
                    Spacer()
                    
                }
                
                
                
                Image(hortCultMain?.color == .light ? "hortFruitLight" : "hortFruitDark")
                    .padding(.top, 40)
                    Spacer()
               
                
            }.ignoresSafeArea()
            
           
        }.ignoresSafeArea()
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(action: {print("olá")}, hiddenDismissButton: false)
    }
}
