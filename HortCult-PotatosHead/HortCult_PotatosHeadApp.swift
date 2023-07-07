//
//  HortCult_PotatosHeadApp.swift
//  HortCult-PotatosHead
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCult_PotatosHeadApp: App {
    
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    //    var defaultShared = Defaults.defaultsShared
    
    @StateObject var defaults = Defaults()
    
    var color: ColorScheme? {
        if defaults.theme == "Padrão do Sistema" {
           return nil
       } else if defaults.theme == "Claro" {
           return .light
       } else {
           return .dark
       }
   }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if HortCult_PotatosHeadApp.isFirstLogin == true {
                    OnBoardingScreen(defaults: defaults)
                        .preferredColorScheme(.light)
                        .environmentObject(defaults)
                        
                } else {
                    MainView()
                        .preferredColorScheme(color)
                        .environmentObject(defaults)
                }
            }
            .environmentObject(defaults)
        }
    }
}
