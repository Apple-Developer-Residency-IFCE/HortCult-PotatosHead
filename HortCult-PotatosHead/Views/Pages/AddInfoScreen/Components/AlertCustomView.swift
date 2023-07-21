//
//  AlertCustomView.swift
//  HortCult-PotatosHead
//
//  Created by Yohanne Moreira on 03/07/23.
//
import SwiftUI


enum alertas {
    case add
    case delete
    case confirmDelete
    case deleteAdd
}


struct AlertCustomView: View {
    @State var alerta : alertas
    var plant: Plant

    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack {
            if alerta == .add {
            RoundedRectangle(cornerRadius: 12)
                .frame(width: 260, height: 147)
                .foregroundColor(Color("BackgroundComponent"))

            VStack(spacing: 0){
                VStack{
                    Text("Planta cadastrada!")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .foregroundColor(Color("MainColor"))
                        .bold()
                        .padding(.top, 17)

                    Text("""
                         Você pode ver sua planta diretamente
                               na tela inicial, em \"Minha Horta\"
                         """)
                    .font(.custom("Satoshi-Regular", size: 12))
                    .foregroundColor(Color("TextColor"))
                    .padding(.top, 1.5)
                    .padding(.bottom, 14)

                    Divider().frame(width: 260)
                }

                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Tela inicial")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("TextColor"))
                    }).frame(minWidth: 130, minHeight: 22)

                    Divider().frame(height: 44)
                    //                        .padding(.bottom, 6)
                    NavigationLink(destination: HortaInformationScreen(plant: plant), label: {
                        VStack{
                            Text("Ver planta")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("tabBarSelectedItem"))
                                .bold()
                        }.frame(minWidth: 130, minHeight: 22)
                    })
//                    Button(action: {
//                        self.presentationMode.wrappedValue.dismiss()
//                        HortaInformationScreen(plant: plant)
//                    }, label: {
//                        Text("Ver planta")
//                            .font(.custom("Satoshi-Regular", size: 16))
//                            .foregroundColor(Color("tabBarSelectedItem"))
//                            .bold()
//                    }).frame(minWidth: 130, minHeight: 22)

                }.frame(width: 260, height: 45)
            }
        }

            if alerta == .confirmDelete{

                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 260, height: 147)
                    .foregroundColor(Color("BackgroundComponent"))

                VStack(spacing: 0){
                    VStack{
                        Text("Deseja excluir essa planta? ")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("MainColor"))
                            .bold()
                            .padding(.top, 17)

                        Text(" Essa ação não poderá ser desfeita")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 1.5)
                        .padding(.bottom, 14)

                        Divider().frame(width: 260)
                    }

                    HStack(alignment: .center){
                        Button(action: {
                            // code
                        }, label: {
                            Text("Cancelar")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("TextColor"))
                        }).frame(minWidth: 130, minHeight: 22)

                        Divider().frame(height: 44)
                        //                        .padding(.bottom, 6)
                        Button(action: {
                            // code
                        }, label: {
                            Text("Excluir")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("red"))
                                .bold()
                        }).frame(minWidth: 130, minHeight: 22)

                    }.frame(width: 260, height: 45)
                }
                
            }

            if alerta == .delete {

                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 260, height: 110)
                    .foregroundColor(Color("BackgroundComponent"))

                VStack(spacing: 0){
                    
                        Text("Planta excluída!")
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("MainColor"))
                            .bold()
                            .padding(.vertical, 21)
                        Divider().frame(width: 260)
                    

                    HStack(){
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Voltar para Tela Inicial")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("TextColor"))
                        })



                    }.frame(width: 260, height: 45)
                }

            }

            if alerta == .deleteAdd {

                RoundedRectangle(cornerRadius: 12)
                    .frame(width: 260, height: 147)
                    .foregroundColor(Color("BackgroundComponent"))

                VStack(spacing: 0){
                    VStack{
                        Text("""
                             Deseja descartar a criação
                                    da sua planta?
                             """)
                            .font(.custom("Satoshi-Regular", size: 16))
                            .foregroundColor(Color("MainColor"))
                            .bold()
                            .padding(.top, 17)

                        Text(" Essa ação não poderá ser desfeita")
                        .font(.custom("Satoshi-Regular", size: 12))
                        .foregroundColor(Color("TextColor"))
                        .padding(.top, 1.5)
                        .padding(.bottom, 14)

                        Divider().frame(width: 260)
                    }

                    HStack {
                        Button(action: {
                            // code
                        }, label: {
                            Text("Cancelar")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("TextColor"))
                        }).frame(minWidth: 130, minHeight: 22)

                        Divider().frame(height: 44)
                        //                        .padding(.bottom, 6)
                        Button(action: {
                            // code
                        }, label: {
                            Text("Descartar")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .foregroundColor(Color("red"))
                                .bold()
                        }).frame(minWidth: 130, minHeight: 22)

                    }.frame(width: 260, height: 45)
                }

            }
            
        }


    }
}

struct AlertCustomView_Previews: PreviewProvider {
    static var previews: some View {
        AlertCustomView(alerta: .delete, plant: Plant())
    }
}
