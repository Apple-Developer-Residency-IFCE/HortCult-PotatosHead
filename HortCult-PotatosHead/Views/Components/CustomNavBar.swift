//
//  testeNav.swift
//  HortCult-PotatosHead
//
//  Created by Gabriel Carvalho on 15/06/23.
//

import SwiftUI

struct CustomNavBar: View {
    
    var hiddenDismissButton: Bool = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
       
        VStack{
            
            ZStack {
            
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(height: 100)
                        .foregroundColor(Color("backgroundnavbarcolor"))
                    
                    Rectangle()
                        .frame(height: 0.5)
                        .foregroundColor(Color("RectangleBar"))
                        
                }
                
                Image("NavBar")
                    .padding(.top, 40)
                   Spacer()
               
                if(!hiddenDismissButton){
                    HStack{
                        
                        Button(action:{
                                            self.presentationMode.wrappedValue.dismiss()
                                        } )  {
                            Image("leftArrow")
                                .renderingMode(.template)
                                .foregroundColor(Color("navbardismissbuttoncolor"))
                                .padding(.leading, 20)
                              
                        }.padding(.top, 40)
                        
                        Spacer()
                        
                    }

                }
            }
            
           
        }
    }
}

struct CustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBar(hiddenDismissButton: false)
    }
}
