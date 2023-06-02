//
//  ScrollProfilePhoto.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 26/05/23.
//

import SwiftUI

struct ScrollProfilePhoto: View {
    let images = ["Image", "Image 1", "Image 2"]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(0..<3){ i in
                    Image("\(images[i])").resizable().ignoresSafeArea()
                    
                }
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(height: 390)
        }
    }
}

struct ScrollProfilePhoto_Previews: PreviewProvider {
    static var previews: some View {
        ScrollProfilePhoto()
    }
}
