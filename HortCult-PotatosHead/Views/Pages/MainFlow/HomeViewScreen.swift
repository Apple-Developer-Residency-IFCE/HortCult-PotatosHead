//
//  SwiftUIView.swift
//  HortCult-PotatosHead
//
//  Created by userext on 30/05/23.
//


import SwiftUI

struct HomeView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var defaults: Defaults
    @ObservedObject var plantViewModel: PlantViewModel
    @EnvironmentObject var imageViewModel: ImageViewModel
    @EnvironmentObject var notificationViewModel: NotificationViewModel
    @State var goToAddPlantScreen: Bool = false
    @State var mokeRemainderList: [Notification] = []
    @State var cardModels: [CardViewModel] = []
    var body: some View {
        ScrollView(.vertical){
            VStack {
                CustomNavBar(hiddenDismissButton: true)
                Spacer()
                ScrollView {
                    HeaderMenu(plantViewModel: plantViewModel, noticationList: $cardModels )
                    Spacer().frame(height: plantViewModel.plants.isEmpty ? 120 : 0)
                }
                Spacer().frame(height: plantViewModel.plants.isEmpty ? 120 : 0)
                .padding(.bottom, 20)
                
                CardListView(cards: $cardModels)
            }
            .onAppear() {
                cardModels = []
                let remindersList = notificationViewModel.notifications.compactMap({ Notification in
                    Notification
                }).filter { Notification in
                    let currentDate = Date()
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd/MM/yyyy"
                    let dateString = dateFormatter.string(from: currentDate)
                    
                    return (!Notification.is_resolve && Notification.next_time_to_alert == dateString && Notification.notification_plant != nil)
                }
                
                remindersList.forEach { Notification in
                    
                    let notificationDisplayed = HomeViewModel.notificationsTextsToDisplay(notification: Notification)
                    let cardModel: CardViewModel = CardViewModel(
                        id: notificationDisplayed.id,
                        title: notificationDisplayed.title,
                        content: notificationDisplayed.description,
                        icon: notificationDisplayed.icon,
                        cardColor: notificationDisplayed.cardColor,
                        backgroudCardColor: notificationDisplayed.backgroudCardColor,
                        textColor: notificationDisplayed.textColor
                    )
                    cardModels.append(cardModel)
                }
            }
        }
        .background(NavigationLink(destination: AddInfoScreen(noticationList: $cardModels, plantViewModel: plantViewModel), isActive: $goToAddPlantScreen, label: {EmptyView()}))
        .navigationBarBackButtonHidden(true)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(plantViewModel: PlantViewModel())
            .environmentObject(Defaults())
    }
}

struct NotificationAdapter {
    
    var id: UUID? = UUID()
    var is_resolve: Bool? = false
    var next_time_to_alert: String? = ""
    var time_to_alert: String? = ""
    var type_to_alert: String? = ""
    var notification_plant: PlantAdapter? = PlantAdapter()
    
    init() {}
    
    init(notification: Notification) {
        self.id = notification.id
        self.is_resolve = notification.is_resolve
        self.next_time_to_alert = notification.next_time_to_alert
        self.time_to_alert = notification.time_to_alert
        self.type_to_alert = notification.type_to_alert
        self.notification_plant = PlantAdapter(category: notification.notification_plant?.category,id: notification.notification_plant?.id,name: notification.notification_plant?.name)
    }
}

struct PlantAdapter {
    var category: String? = ""
    var id: UUID? = UUID()
    var information: String? = ""
    var name: String? = "Jninho"
    var watering_frequency: String? = ""
    var plant_notification: [NotificationAdapter]? = []
    var plant_hortcult_images: [Hortcult_Images]? = []
    
}
