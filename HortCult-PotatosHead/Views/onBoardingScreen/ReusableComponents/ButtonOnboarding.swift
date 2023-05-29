//
//  ButtonView.swift
//  testeComponentes
//
//  Created by userext on 24/05/23.
//

import SwiftUI

struct ReusableButton: View {
    var buttonTitle: String
    var action: (() -> Void)
    var backGroundColor: Bool
    var icon: Bool
    
    var body: some View {
        Button(action: {
            action()
        }) {
            
            if backGroundColor {
                
                if icon {
                    HStack{
                        Text(buttonTitle)
                        Image(systemName: "arrow.right")
                        
                    }
                    .foregroundColor(Color("backgroundColor"))
                    .frame(width: 277, height: 42)
                    .background(Color("MainColor"))
                    .cornerRadius(40)
                    
                } else {
                    Text(buttonTitle)
                        .foregroundColor(Color("backgroundColor"))
                        .frame(width: 277, height: 42)
                        .background(Color("MainColor"))
                        .cornerRadius(40)
                }
                
                
            } else {
                
                if icon {
                    HStack{
                        Text(buttonTitle)
                        Image(systemName: "arrow.right")
                    }
                    
                    .foregroundColor(Color("MainColor"))
                    .frame(width: 277, height: 42)
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color("MainColor"), lineWidth: 1)
                    }
                } else {
                    Text(buttonTitle)
                        .foregroundColor(Color("MainColor"))
                        .frame(width: 277, height: 42)
                        .overlay {
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("MainColor"), lineWidth: 1)
                        }
                }
                
                
                
            }
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableButton(buttonTitle: "Iniciar", action: {print("ola")}, backGroundColor: true, icon: true)
    }
}

