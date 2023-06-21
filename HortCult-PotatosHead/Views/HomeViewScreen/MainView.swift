//
//  SwiftUIView.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State private var jumpToInitalScreen = false
    @EnvironmentObject var defaults: Defaults
    @ObservedObject var plantViewModel: PlantViewModel
    var body: some View {
        
        ZStack {
    
            NavigationView {
                if isSelectedTab == 0 {
                    
                    HomeView(plantViewModel: plantViewModel)
                        .padding(.top)
                        .ignoresSafeArea()
                } else {
                    AdjustmentView()
//                        .environmentObject(defaults)
                        Spacer()
                    
                }
            }
            
            .navigationBarHidden(true)
                
            
            CustomTabBar(action: { isSelectedTab = 0
                isNextScreenActive = false
            },
                         actionTwo: {isSelectedTab = 1},
                         colorOne: isSelectedTab == 0 ? Color("tabBarSelectedItem") : Color("navBarColor"),
                         colorTwo: isSelectedTab == 1 ? Color("tabBarSelectedItem") : Color("navBarColor"))
        }.ignoresSafeArea()
    }
    
    
    
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView(plantViewModel: PlantViewModel())
                .environmentObject(Defaults())
        }
    }
}

