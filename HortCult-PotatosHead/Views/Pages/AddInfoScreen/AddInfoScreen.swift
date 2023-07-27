import SwiftUI

struct AddInfoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isSelectedTab = 0
    @State private var isNextScreenActive = false
    @State var nameText: String = ""
    @State var descriptionText: String = ""
    @State var category: Category?
    @State var frequency: Frequency?
    @State var isDisabled: Bool = false
    @State var selectedPhotosData: [Data] = []
    @Binding var noticationList: [CardViewModel]
    @State private var presentAlert = false
    @State private var addAlert = false
    @EnvironmentObject var defaults: Defaults
    @State var plant: Plant?
    @State var isEdit: Bool = false
    var body: some View {
        ZStack {
            VStack {
                CustomNavBar(hiddenDismissButton: false)
                ScrollView {
                    HStack {
                        Text(isEdit ? "Editar Informações" : "Adicionar Vegetal")
                            .font(.custom("Satoshi-Bold", size: 28))
                            .foregroundColor(Color("MainColor"))
                        Spacer()
                    }
                    .padding()
                    TextScreen(text: $nameText, description: $descriptionText, isEdit: false)
                        .padding(.bottom, 20)
                    CategoryDropDownView(selectedOption: $category)
                        .padding(.bottom, 20)
                    FrequencyDropDownView(selectedOption: $frequency)
                        .padding(.bottom, 20)
                    ImagePickerComponentView(selectedPhotosData: $selectedPhotosData)
                        .padding(.bottom, 110)
                }
            }.edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                if !isEdit {
                    if AddInfoScreenViewModel.fieldsVerification(frequency: frequency,
                                                                 category: category,
                                                                 nameText: nameText,
                                                                 descriptionText: descriptionText) {
                        AddButton(isDisabled: true) {}
                    } else {
                        AddButton(isDisabled: false) {
                            guard let neewPlant = AddInfoScreenViewModel.createPlant(
                                name: nameText,
                                categoria: category,
                                information: descriptionText,
                                frequencia: frequency) else {return}
                            selectedPhotosData.forEach { data in
                                AddInfoScreenViewModel.setPlantImage(data: data, newPlant: neewPlant)
                            }
                            addAlert = true
                            let newNotification = AddInfoScreenViewModel.setNewNotification(newPlant: neewPlant,
                                                                                            frequency: frequency!)
                            let notificationDisplayed = HomeViewModel.notificationsTextsToDisplay(
                                notification: newNotification
                            )
                            if AddInfoScreenViewModel.verifyNotificationToday(
                                date: newNotification.next_time_to_alert ?? "") {
                                noticationList.append(CardViewModel(
                                    id: notificationDisplayed.id,
                                    title: notificationDisplayed.title,
                                    content: notificationDisplayed.description,
                                    icon: notificationDisplayed.icon,
                                    cardColor: notificationDisplayed.cardColor,
                                    backgroudCardColor: notificationDisplayed.backgroudCardColor,
                                    textColor: notificationDisplayed.textColor))
                            }
                        }
                    }
                } else {
                    if AddInfoScreenViewModel.fieldsVerification(frequency: frequency,
                                                                 category: category,
                                                                 nameText: nameText,
                                                                 descriptionText: descriptionText) {
                        EditButton(isDisabled: true) {}
                    } else {
                        EditButton(isDisabled: false) {
                            if !isEdit {
                                guard let plantEdit = AddInfoScreenViewModel.createPlant(
                                    name: nameText,
                                    categoria: category,
                                    information: descriptionText,
                                    frequencia: frequency) else {return}
                                self.presentationMode.wrappedValue.dismiss()
                            } else {
                                AddInfoScreenViewModel.updatePlant(frequencia: frequency,
                                                                   categoria: category,
                                                                   name: nameText,
                                                                   information: descriptionText,
                                                                   plant: plant)
                                plant!.plant_hortcult_images?.allObjects.forEach({ image in
                                    AddInfoScreenViewModel.updatePlantImage(plant: plant, image: image)
                                })
                                selectedPhotosData.forEach { data in
                                    AddInfoScreenViewModel.setPlantImage(data: data, newPlant: plant!)
                                }
                                self.presentationMode.wrappedValue.dismiss()
                            }
                        }
                    }
                }
            }
            if presentAlert {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(0)
            }
            if addAlert {
                AlertCustomView(alerta: .add, plant: Service.plant.plants.last ?? Plant())
                    .zIndex(1)
                    .onAppear {
                        presentAlert = true
                    }
            }
        }
        .padding(.bottom, 60)
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
    }
}
