//
//  WelcomeView.swift
//  HortCult-PotatosHead
//
//  Created by João Vitor Alves Holanda on 05/07/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    

    var body: some View {
        VStack {            
            // Aqui a tela de clima, pedindo permissao
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .symbolVariant(.fill)
            .labelStyle(.titleAndIcon) 
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
