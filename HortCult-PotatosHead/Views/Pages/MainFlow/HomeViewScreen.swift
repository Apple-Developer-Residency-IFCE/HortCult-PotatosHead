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
    @State var goToAddPlantScreen: Bool = false
    @State var mokeRemainderList: [Notification] = []
    @State var cardModels: [CardViewModel] = []
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                CustomNavBar(hiddenDismissButton: true)
                Spacer()
                ScrollView {
                    HeaderMenu(noticationList: $cardModels )
                    Spacer().frame(height: Service.plant.plants.isEmpty ? 120 : 0)
                }
                Spacer().frame(height: Service.plant.plants.isEmpty ? 120 : 0)
                    .padding(.bottom, 20)
                CardListView(cards: $cardModels)
            }
            .onAppear {
                cardModels = []
                let remindersList = HomeViewModel.getReminderCardByDate()
                remindersList.forEach { notification in
                    let notificationDisplayed = HomeViewModel.notificationsTextsToDisplay(notification: notification)
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
        .background(NavigationLink(
            destination: AddInfoScreen(noticationList: $cardModels),
            isActive: $goToAddPlantScreen, label: {EmptyView()}))
        .navigationBarBackButtonHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Defaults())
    }
}
