//
//  AdjustmentItem.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct AdjustmentItem: View {
    var label: String
    @Binding var isOn: Bool
    var onSwitch: (()->Void)?
    enum ActionElements{
        case button
        case switcher
        case none
    }
    var actionElement: ActionElements = .none
    
    var dinamicElement: some View {
        Group{
            switch actionElement {
            case .button:
             
                    HStack{
                        Text("Claro")
                            .padding(.trailing,16)
                            .foregroundColor(Color("ButtonThemeColor"))
                            .font(.custom("Satoshi-Bold", size: 16))
                        Image("next-icon-light")
                    }
                
            case .switcher:
                Toggle("", isOn: $isOn).onTapGesture {
                    HortCult_PotatosHeadApp.enableNotification = isOn
                }

            case .none:
                Text("")
            }
        }
    }
    
    var body: some View {
        HStack {
            Text(label)
                .font(.custom("Satoshi-Bold", size: 18))
                .fontWeight(.bold)
                .foregroundColor(Color("MainColor"))
            Spacer()
            dinamicElement
            
        }
    }
}
