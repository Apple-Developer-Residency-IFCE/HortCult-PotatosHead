//
//  MainScreen.swift
//  HortCult-PotatosHead
//
//  Created by Gabriel Carvalho on 13/06/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State private var jumpToInitalScreen = false
    
    var body: some View {
        
        ZStack {
        
            NavigationView {
                if isSelectedTab == 0 {
                    
                    HomeView()
                        .padding(.top)
                    
                } else {
                    AdjustmentView(defaults: Defaults())
                        Spacer()
                }
            }.navigationBarHidden(true)
            
            CustomTabBar(action: { isSelectedTab = 0
                isNextScreenActive = false
            },
                         actionTwo: {isSelectedTab = 1},
                         colorOne: isSelectedTab == 0 ? Color("tabBarSelectedItem") : Color("navBarColor"),
                         colorTwo: isSelectedTab == 1 ? Color("tabBarSelectedItem") : Color("navBarColor"))
        }
    }
    
    
    
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView()
        }
    }
}
