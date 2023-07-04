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
    @ObservedObject var plantViewModel: PlantViewModel = PlantViewModel()
    @ObservedObject var imageViewModel: ImageViewModel = ImageViewModel()
    @ObservedObject var notificationViewModel: NotificationViewModel = NotificationViewModel()
    @StateObject var defaults: Defaults = Defaults.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                if HortCult_PotatosHeadApp.isFirstLogin == true {
                    OnBoardingScreen(plantViewModel: plantViewModel)
                        .preferredColorScheme(.light)
                        
                } else {
                    MainView(plantViewModel: plantViewModel)
                        .preferredColorScheme(defaults.color)
                }
            }
            .environmentObject(imageViewModel)
            .environmentObject(plantViewModel)
            .environmentObject(notificationViewModel)
        }
    }
}
