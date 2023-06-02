//
//  AdjustmentView.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//

import SwiftUI

struct AdjustmentView: View {
    @State var switcherOn: Bool = true
    @State var timeToAlert: String = ""
    @State var time: Date = Date()
    @State var openConfia: Bool = true
    
    var body: some View {
        
        VStack{
            
            Image("Topbar")
            
            
            Group{
                HStack{
                    Text("Ajustes")
                        .font(.custom("Satoshi-Bold", size: 28))
                        .foregroundColor(Color("MainColor"))
                        .padding(.top, 20)
                    Spacer()
                }
                AdjustmentItem(label: "Tema", isOn: $switcherOn, actionElement: .button)
                Divider()
                
                AdjustmentItem(label: "Notificações Push",isOn: $switcherOn, actionElement: .switcher)
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
                            
                            TextField("00:00", text: $timeToAlert)
                                .padding(.leading, 12)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color("navBarColor"), lineWidth: 1)
                                        .frame(height: 38)
                                    HStack{
                                        Spacer()
                                        Image("watch_icon")
                                            .padding(.trailing, 16)
                                    }
                                        
                                        
                                }
                            DatePicker(
                                    "Scebolitos",
                                     selection: $time,
                                     displayedComponents: [.hourAndMinute]
                            ).datePickerStyle(.wheel)
                                        
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

struct AdjustmentView_Previews: PreviewProvider {
    static var previews: some View {
        AdjustmentView()
    }
}
