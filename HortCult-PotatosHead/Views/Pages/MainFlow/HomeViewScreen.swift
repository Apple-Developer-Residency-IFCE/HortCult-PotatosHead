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
    @State var goToAddPlantScreen: Bool = false
    @State var mokeRemainderList: [Notification] = []
    @State var cardModels: [CardViewModel] = []
    var body: some View {
        NavigationView {
            ScrollView(.vertical){
            VStack {
                CustomNavBar(hiddenDismissButton: true)
                    Spacer()
                
                HeaderMenu(plantViewModel: plantViewModel){
                    goToAddPlantScreen = true
                }
                Spacer().frame(height: plantViewModel.plants.isEmpty ? 120 : 0)
                   
                   .padding(.bottom, 20)
                CardListView(cards: cardModels)


            }
            .task {
                
                for _ in 1...10 {
                    let mokitem = NotificationAdapter()
                    let cardModel: CardViewModel = CardViewModel(
                        title: mokitem.notification_plant?.name ?? "",
                        content: mokitem.time_to_alert ?? "",
                        icon: "Water-Orange",
                        cardColor: "lembreteIcon",
                        backgroudCardColor: "AlertCardColor",
                        textColor: "TextColor",
                        titleFont: "Satoshi-Bold",
                        contentFont: "Satoshi-Regular"
                    )
                    cardModels.append(cardModel)
                }
            }
            }
            
            .background(NavigationLink(destination: AddInfoScreen(plantViewModel: plantViewModel), isActive: $goToAddPlantScreen, label: {EmptyView()}))
        }
            .navigationBarBackButtonHidden(true)
//            .navigationBarItems(leading: header)
            
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
    var name: String? = "No name"
    var watering_frequency: String? = ""
    var plant_notification: [NotificationAdapter]? = []
    var plant_hortcult_images: [Hortcult_Images]? = []
    
}
