//
//  ScrollProfilePhoto.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 26/05/23.
//

import SwiftUI

struct ScrollProfilePhoto: View {
    
    
    var body: some View {
                    ScrollView(.horizontal) { // <1>
                        
                        HStack(spacing: 0) { // <2>
                            
                            ForEach(0..<3) { index in
                                ZStack{
                                   
                                    Image("Tomate")
                                        .frame(maxWidth: .infinity)
                                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.5), Color.black.opacity(0)]), startPoint: .top, endPoint: .center)
                                        .edgesIgnoringSafeArea(.all).allowsHitTesting(false)
                                }
                            }
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
    }
}

struct ScrollProfilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ScrollProfilePhoto()
    }
}
