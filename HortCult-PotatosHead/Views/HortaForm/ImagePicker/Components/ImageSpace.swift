//
//  ImageSpace.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 15/06/23.
//

import SwiftUI

struct DottedRectangle: View {
    var body: some View {
        Rectangle()
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [8]))
            .frame(width: 120, height: 120)
            .cornerRadius(8)
            .overlay(
                Rectangle()
                    .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                    .foregroundColor(.clear)
            )
    }
}

struct ImageSpace:View {
    
    var image:UIImage?
    
    var body: some View {
        if let img = image {
            Image(uiImage: img)
                .resizable()
                .frame(width: 120,height: 120)
                .cornerRadius(12)
        }
        else {
            DottedRectangle()
        }
    }
}

struct ImageSpace_Previews: PreviewProvider {
    static var previews: some View {
        ImageSpace()
    }
}
