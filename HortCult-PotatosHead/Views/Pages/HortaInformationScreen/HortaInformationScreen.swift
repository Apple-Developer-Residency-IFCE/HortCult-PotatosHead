//
//  HortaInformation.swift
//  HortCult-PotatosHead
//
//

import SwiftUI


struct HortaInformationScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @Environment(\.dismiss) var dismiss
    @State var activeNotification: Notification = Notification()
    var plant: Plant
    
    @State private var presentAlert = false
    @State private var deleteAlert = false
    @State private var confirmAlert = false
    
    var header: some View {
        NavigationLink(destination: HomeView(), label: {
            ZStack {
                VStack {
                    HStack {
//                        Button(action: {
//                            self.presentationMode.wrappedValue.dismiss()
//                        })
                        
                            Image("Arrow-Left-White")
                            Text("Voltar").foregroundColor(Color(.white)).font(.custom("Satoshi-Regular", size: 16))
                      
                        
                    }.padding(.leading, 12).padding(.trailing, -8)
                }
            }
        }).ignoresSafeArea(.all)
        }
    
    var body: some View {
        ZStack {
            VStack (spacing: 0) {
                
                
                ScrollView(.vertical){
                    ScrollProfilePhoto(plant: plant)
                        .frame(minWidth: 390, minHeight: 390)
                    
                    VStack(alignment: .leading){
                        VStack(alignment: .leading){
                            Spacer()
                            HStack {
                                Text(plant.name ?? "NAO TEM NOME")
                                    .font(.custom("Satoshi-Regular", size: 28))
                                    .foregroundColor(Color("MainColor"))
                                    .bold()
                                Spacer()
                                HortaType(type: plant.category ?? "NAO TEM CATEGORIA")
                            }
                            .padding(.bottom,24)
                            Text(plant.information ?? "NAO TEM INFO")
                                .font(.custom("Satoshi-Regular", size: 16))
                                .padding(.bottom,24)
                            CardProximaRega(content: Service.plant.getNextWatering(plant: plant)){
                                Service.notification.updateNotification(notification: activeNotification, next_time_to_alert: activeNotification.next_time_to_alert!, time_to_alert: activeNotification.time_to_alert!, type_to_alert: activeNotification.type_to_alert!, is_resolve: true)
                                
                                guard let newNotification = Service.notification.createNotification(next_time_to_alert: Service.notification.calculateNextWatering(wateringFrequency: Frequency(rawValue: plant.watering_frequency!)!), time_to_alert: "", type_to_alert: NotificationType.watering.rawValue) else {return}
                                Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
                            }
                            .padding(.bottom,24)
                            if let freq = plant.watering_frequency {
                                FrequenciaRega(frequencia: freq)
                                    .padding(.horizontal)
                            } else {
                                
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.vertical, 16)
                    }
                    VStack(alignment: .center){
                        
                        NavigationLink(destination:
                                        EditInfoView(plant: plant)
                                       ,label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color("MainColor"), lineWidth: 2)
                                    .frame(width: 277, height: 42)
                                
                                HStack {
                                    Image("Edit")
                                        .renderingMode(.template)
                                        .foregroundColor(Color("MainColor"))
                                    Text("Editar informações")
                                        .font(.custom("Satoshi-Bold", size: 16))
                                        .foregroundColor(Color("MainColor"))
                                    
                                }
                            }
                        })
                        Button {
                            deleteAlert = true
                            //                            self.presentationMode.wrappedValue.dismiss()
                            //                            Service.plant.deletePlant(plant: plant)
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 40)
                                    .frame(width: 277, height: 42)
                                    .foregroundColor(Color("red"))
                                
                                HStack {
                                    Image("Trash")
                                        .renderingMode(.template)
                                        .foregroundColor(Color("backgroundColor"))
                                    Text("Excluir da Minha Horta")
                                        .font(.custom("Satoshi-Bold", size: 16))
                                        .foregroundColor(Color("backgroundColor"))
                                }
                            }
                            
                        }
                    }
                    Spacer(minLength: 100)
                }.ignoresSafeArea(.all)
            }
            if presentAlert {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0)
            }
            if deleteAlert {
                
                ZStack{
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
                                presentAlert = false
                                deleteAlert = false
                            }, label: {
                                Text("Cancelar")
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("TextColor"))
                            }).frame(minWidth: 130, minHeight: 22)
                            
                            Divider().frame(height: 44)
                            //                        .padding(.bottom, 6)
                            Button(action: {
                                confirmAlert = true
                                presentAlert = false
                                deleteAlert = false
                                Service.plant.deletePlant(plant: plant)
                            }, label: {
                                Text("Excluir")
                                    .font(.custom("Satoshi-Regular", size: 16))
                                    .foregroundColor(Color("red"))
                                    .bold()
                            }).frame(minWidth: 130, minHeight: 22)
                            
                        }.frame(width: 260, height: 45)
                    }
                    .zIndex(1)
                    .onAppear{
                        presentAlert = true
                    }
                }
            }
            if confirmAlert {
                AlertCustomView(alerta: .delete, plant: plant)
                    .zIndex(1)
                    .onAppear{
                        presentAlert = true
                    }
            }
        }
        
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: header)
        .toolbarBackground(.hidden, for: .navigationBar)
        .task {
            guard let getActiveNotification = Service.plant.getActiveAlert(plant: plant, notificationType: .watering) else {return}
            activeNotification = getActiveNotification
        }
    }
}

