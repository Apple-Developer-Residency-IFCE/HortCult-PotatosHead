//
//  HortaInformation.swift
//  HortCult-PotatosHead
//
//

import SwiftUI


struct HortaInformationScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var plantViewModel: PlantViewModel
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @State var activeNotification: Notification = Notification()
    var plant: Plant
    
    var header: some View {
        ZStack {
            VStack{
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Arrow-Left-White")
                        Text("Voltar").foregroundColor(Color(.white)).font(.custom("Satoshi-Regular", size: 16))
                    }
                    .padding(.leading,12).padding(.trailing,-8)
                }
            }
        }
    }
    
    var body: some View {
            ScrollView(.vertical){
                ScrollProfilePhoto()
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
                        CardProximaRega(title: "Próxima rega:", content: plantViewModel.getNextWatering(plant: plant), icon: "Water-Blue", cardColor: "blueReminderIcon", backgroudCardColor: "BlueAlertCard", textColor: "TextColor", titleFont: "Satoshi-Regular", contentFont: "Satoshi-Bold"){
                            notificationViewModel.updateNotification(notification: activeNotification, next_time_to_alert: activeNotification.next_time_to_alert!, time_to_alert: activeNotification.time_to_alert!, type_to_alert: activeNotification.type_to_alert!, is_resolve: true)
                            
                           guard let newNotification = notificationViewModel.createNotification(next_time_to_alert: notificationViewModel.calculateNextWatering(wateringFrequency: Frequency(rawValue: plant.watering_frequency!)!), time_to_alert: "", type_to_alert: NotificationType.watering.rawValue) else {return}
                            plantViewModel.addNotificationToPlant(plant: plant, notification: newNotification)
                        }
                            .padding(.bottom,24)
                        if let freq = plant.watering_frequency {
                            FrequenciaRega(plantViewModel: plantViewModel, frequencia: freq)
                                .padding(.horizontal)
                        } else {
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 16)
                }
                VStack(alignment: .center){
                    
                    NavigationLink(destination:
                        EditInfoView(plantViewModel: plantViewModel, plant: plant)
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
                        self.presentationMode.wrappedValue.dismiss()
                        plantViewModel.deletePlant(plant: plant)
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
            }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: header)
        .toolbarBackground(.hidden, for: .navigationBar)
        .task {
            guard let getActiveNotification = plantViewModel.getActiveAlert(plant: plant, notificationType: .watering) else {return}
            activeNotification = getActiveNotification
        }
    }
}

