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
//    @ViewBuilder var content: () -> Content
    var body: some Scene {
        WindowGroup {
            
            AdjustmentView()
        }
    }
}
