//
//  ListHorta.swift
//  HortCult-PotatosHead
//
//  Created by Joao Guilherme Araujo Canuto on 24/05/23.
//

import SwiftUI

struct Horta {
    var nome : String
    var imagePath : String
}

struct Header: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                } ) {
                    Image("leftArrow")
                    Text("AAAAAAAA")
                }
                .padding(.leading, 12)
                Spacer()
            }
        }
    }
}

struct ListHorta: View {

    
    var body: some View {
        NavigationView{
            ScrollView(.horizontal){
                HStack(spacing: 12){
                    NavigationLink {
                        ZStack{
                            Header()
                            ScrollProfilePhoto()
                                .edgesIgnoringSafeArea(.all)
                        }
                        HortaInformation()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }
                    NavigationLink {
                        HortaInformation()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }

                    NavigationLink {
                        HortaInformation()
                    } label: {
                        HortaComponent(imagePath: "Tomate", nameHorta: "Tomate")
                    }
                }
                .foregroundColor(Color("title"))
            }
        }
    }
}

struct ListHorta_Previews: PreviewProvider {
    static var previews: some View {
        ListHorta()
    }
}
