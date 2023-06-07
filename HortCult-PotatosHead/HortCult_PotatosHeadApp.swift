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
    @AppStorage ("theme") static var theme: String = "default"
    @AppStorage ("time-notification") static var timeNotification: String = "00:00"
    @AppStorage ("enable-notification") static var enableNotification: Bool = false

    var body: some Scene {
        WindowGroup {
            
            if HortCult_PotatosHeadApp.isFirstLogin == true {
                OnBoardingScreen()
            } else {
                OnboardingScreenFour()
            }            
        }
    }
}
