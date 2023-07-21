import SwiftUI

struct HortaInformationScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var activeNotification: Notification = Notification()
    var plant: Plant

    var header: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("Arrow-Left-White")
                        Text("Voltar").foregroundColor(Color(.white)).font(.custom("Satoshi-Regular", size: 16))
                    }
                    .padding(.leading, 12).padding(.trailing, -8)
                }
            }
        }
    }

    var body: some View {
        ScrollView(.vertical) {
            ScrollProfilePhoto(plant: plant)
                .frame(minWidth: 390, minHeight: 390)
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Spacer()
                    HStack {
                        Text(plant.name ?? "NAO TEM NOME")
                            .font(.custom("Satoshi-Regular", size: 28))
                            .foregroundColor(Color("MainColor"))
                            .bold()
                        Spacer()
                        HortaType(type: plant.category ?? "NAO TEM CATEGORIA")
                    }
                    .padding(.bottom, 24)
                    Text(plant.information ?? "NAO TEM INFO")
                        .font(.custom("Satoshi-Regular", size: 16))
                        .padding(.bottom, 24)
                    CardProximaRega(content: Service.plant.getNextWatering(plant: plant)) {
                        Service.notification.updateNotification(notification: activeNotification,
                                                                nextTimeToAlert: activeNotification.next_time_to_alert!,
                                                                timeToAlert: activeNotification.time_to_alert!,
                                                                typeToAlert: activeNotification.type_to_alert!,
                                                                isResolve: true)
                        guard let newNotification = Service.notification.createNotification(
                            nextTimeToAlert: Service.notification.calculateNextWatering(
                                wateringFrequency: Frequency(rawValue: plant.watering_frequency!)!),
                            timeToAlert: "",
                            typeToAlert: NotificationType.watering.rawValue) else { return }
                        Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
                        activeNotification = newNotification
                    }
                    .padding(.bottom, 24)
                    if let freq = plant.watering_frequency {
                        FrequenciaRega(frequencia: freq)
                            .padding(.horizontal)
                    } else {
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 16)
            }
            VStack(alignment: .center) {
                NavigationLink(destination: EditInfoView(plant: plant), label: {
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
                    Service.plant.deletePlant(plant: plant)
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
            guard let getActiveNotification = Service.plant.getActiveAlert(plant: plant,
                                                                           notificationType: .watering) else { return }
            activeNotification = getActiveNotification
        }
    }
}
