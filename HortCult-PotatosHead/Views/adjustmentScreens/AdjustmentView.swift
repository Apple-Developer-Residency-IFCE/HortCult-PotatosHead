//
//  AdjustmentView.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct AdjustmentView: View {
    @ObservedObject var defaults: Defaults
    @State var theme: String = HortCult_PotatosHeadApp.theme
    @State var switcherOn: Bool = true
    @State var timeToAlert: String = ""
    @State var time: Date = Date()
    @State var openConfia: Bool = true
    @State private var showNextScreen: Bool = false
    
    
    
    var body: some View {
        NavigationView {
            VStack{
                Image("Topbar")
                Group{
                    HStack {
                        Text("Ajustes")
                            .font(.custom("Satoshi-Bold", size: 28))
                            .foregroundColor(Color("MainColor"))
                            .padding(.top, 20)
                        Spacer()

                    }
                    NavigationLink {
                        ThemeSelect(defaults: defaults, selectedOption: defaults.theme)
                    } label: {
                        AdjustmentItem(label: "Tema") {
                            NavigationIconView(label: defaults.theme)
                        }
                    }
                    
                    Divider()
                    AdjustmentItem(label: "Notificações Push") {
                        Toggle("", isOn: $switcherOn).onTapGesture {
                            Defaults.enableNotificationStorage = switcherOn
                        }
                    }
                    Divider()
                    
                    if (switcherOn){
                        VStack {
                            HStack{
                                Text("Notificaçoes")
                                Spacer()
                            }
                            VStack{
                                HStack{
                                    Text("Horários")
                                        .font(.custom("Satoshi-Regular", size: 12))
                                        .foregroundColor(Color("title"))
                                        .padding(.bottom, 6)
                                    Spacer()
                                }

                                NotificationManager()
                            }.padding(.top, 24)


                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
            }
        }
        
    }
}

struct AdjustmentView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentView(defaults: Defaults())
    }
}
