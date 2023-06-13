//
//  ContentView.swift
//  CustomAlert
//
//  Created by Zeeshan Suleman on 02/10/2022.
//

import SwiftUI

import SwiftUI

struct viewview: View {
    
    @State var presentAlert = false
    
    var body: some View {
        ZStack{
            
            Button{
                withAnimation{
                    presentAlert.toggle()
                }
            } label: {
                Text("Show Custom Alert")
            }
            
            if presentAlert{
                
                CustomAlert(presentAlert: $presentAlert) {
                    withAnimation{
                        presentAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        presentAlert.toggle()
                    }
                }
            }
        }
    }
}

struct viewview_Previews: PreviewProvider {
    static var previews: some View {
        viewview()
    }
}
