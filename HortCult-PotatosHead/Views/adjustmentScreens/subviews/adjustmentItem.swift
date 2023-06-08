//
//  AdjustmentItem.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

//struct AdjustmentItem: View {
//    var label: String
//    @Binding var isOn: Bool
//    var onSwitch: (()->Void)?
//    enum ActionElements{
//        case button
//        case switcher
//        case none
//    }
//    var actionElement: ActionElements = .none
//
//    var dinamicElement: some View {
//        Group{
//            switch actionElement {
//            case .button:
//
//
//
//            case .switcher:
//                Toggle("", isOn: $isOn).onTapGesture {
//                    HortCult_PotatosHeadApp.enableNotification = isOn
//                }
//
//            case .none:
//                Text("")
//            }
//        }
//    }
//
//    var body: some View {
//        HStack {
//            Text(label)
//                .font(.custom("Satoshi-Bold", size: 18))
//                .fontWeight(.bold)
//                .foregroundColor(Color("MainColor"))
//            Spacer()
//            dinamicElement
//
//        }
//    }
//}

//struct CellItem<Content: View>: View {
//
//    let label: String
//    let content: Content
//
//    init(label: String, @ViewBuilder _ content: () -> Content) {
//        self.label = label
//        self.content = content()
//    }
//
//    var body: some View {
//        HStack {
//            Text(label)
//                .font(.custom("Satoshi-Bold", size: 18))
//                .fontWeight(.bold)
//                .foregroundColor(Color("MainColor"))
//            Spacer()
//            content
//
//        }
//    }
//}
//
//struct CellItem_Previews: PreviewProvider {
//    static var previews: some View {
//        CellItem(label: "Lucas") {
//            MyButton()
//        }
//    }
//}
//
//struct MyButton: View {
//    var body: some View {
//        HStack{
//            Text("Claro")
//                .padding(.trailing,16)
//                .foregroundColor(Color("ButtonThemeColor"))
//                .font(.custom("Satoshi-Bold", size: 16))
//            Image("next-icon-light")
//        }
//    }
//}

struct AdjustmentItem<Content: View>: View {
    var label: String
    var content: Content
    
    init(label: String, @ViewBuilder _ content: ()-> Content) {
        self.label = label
        self.content = content()
    }
    
    var body: some View{
        HStack {
           Text(label)
               .font(.custom("Satoshi-Bold", size: 18))
               .fontWeight(.bold)
               .foregroundColor(Color("MainColor"))
           Spacer()
           content

       }
    }
}

struct AdjustmentItem_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentItem(label: "Lucas") {
            Text("Teste")        }
    }
}
