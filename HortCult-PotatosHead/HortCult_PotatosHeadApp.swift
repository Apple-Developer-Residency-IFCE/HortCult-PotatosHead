//
//  HortCult_PotatosHeadApp.swift
//  HortCult-PotatosHead
//
//  Created by userext on 23/05/23.
//

import SwiftUI

@main
// swiftlint:disable all
struct HortCult_PotatosHeadApp: App {
    
    @AppStorage ("isFirstLogin") static var isFirstLogin: Bool = true
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    //    var defaultShared = Defaults.defaultsShared
    @StateObject var instance = UserService.instance
    
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
            VStack{
                
                ForEach(UserService.instance.listUsers) { element in
                    Button(element.email, action: {})
                }
                
            }
            .environmentObject(defaults)
            .task {
                UserService.instance.getUsers()
                UserService.instance.createUser()
            }
        }
    }
}
