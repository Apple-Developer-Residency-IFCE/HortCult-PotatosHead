//
//  HortCult_PotatosHeadApp.swift
//  HortCult-PotatosHead
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
struct HortCult_PotatosHeadApp: App {
    let persistenceController = PersistenceController.shared
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    var defaults = Defaults()
    var body: some Scene {
        WindowGroup {
            
            if HortCult_PotatosHeadApp.isFirstLogin == true {
                OnBoardingScreen(defaults: defaults)
            } else {
                MainView(defaults: defaults)
            }            
        }
    }
}
