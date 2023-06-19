//
//  CustomTabBar.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct CustomTabBar: View {
    
    var action: (() -> Void)
    var actionTwo: (() -> Void)
    var colorOne: Color
    var colorTwo: Color

    @State private var selectedTab = 0
    
    var body: some View {
        
            VStack(spacing: 0) {
                Spacer()
                
                ZStack(alignment: .top) {
                    Rectangle()
                        .frame(height: 90)
                        .foregroundColor(Color("backGroundTabBarColor"))
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.1), radius: 12, x: 0, y: -4)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            action()
                        }) {
                            Image("Home-Grey")
                                .renderingMode(.template)
                                .font(.system(size: 4))
                                .foregroundColor(colorOne)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            actionTwo()
                        }) {
                            Image("Settings")
                                .renderingMode(.template)
                                .font(.system(size: 28))
                                .foregroundColor(colorTwo)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, -30)
                    .padding(.top, 25)
                }
            }.edgesIgnoringSafeArea(.bottom)
            .background(Color.clear)
            .frame(height: 1)
        }
    }






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(action: {print("teste")}, actionTwo: {print("2")}, colorOne: Color.black, colorTwo: Color.black)
    }
}

