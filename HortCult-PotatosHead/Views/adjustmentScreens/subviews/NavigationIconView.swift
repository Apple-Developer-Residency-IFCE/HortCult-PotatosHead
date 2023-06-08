//
//  NavigationIconView.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 07/06/23.
//

import SwiftUI

struct NavigationIconView: View {
    var label: String
    
    var body: some View {
        HStack{
            Text(label)
                .foregroundColor(Color("ButtonThemeColor"))
                .font(.custom("Satoshi-Bold", size: 16))
            Image("next-icon-light")
        }

    }
}

struct NavigationIconView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationIconView(label: "teste")
    }
}
