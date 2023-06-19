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
    @ObservedObject var plantViewModel: PlantViewModel = PlantViewModel()
    @ObservedObject var notificationViewModel: NotificationViewModel =
    NotificationViewModel()
    var defaults = Defaults()
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
