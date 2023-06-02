//
//  RadioButton.swift
//  HortCult-PotatosHead
//
//  Created by userext on 01/06/23.
//

import SwiftUI

struct RadioButton: View {
    
    @Binding var selectedOption: String
    var title: String
    var body: some View {
        HStack{
            Button(action: {
                selectedOption = title
            }) {
                HStack {
                    Image(selectedOption == title ? "option_selected" : "option_unselected")
                    Text(title)
                }
            }.foregroundColor(.primary)
        Spacer()
        }

    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton(selectedOption: .constant("Claro"), title: "Claro")
    }
}
