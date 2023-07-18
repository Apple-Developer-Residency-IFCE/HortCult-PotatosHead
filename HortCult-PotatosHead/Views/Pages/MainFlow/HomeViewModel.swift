import SwiftUI
import Foundation

struct HomeViewModel {
    static func notificationsTextsToDisplay (notification: Notification) -> NotificationDisplayed{
        var notificationDisplayed: NotificationDisplayed
        guard let notificationType =  notification.typeToAlert else {return NotificationDisplayed(id: UUID() ,title: "",
                                                                                                    description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor:
                                                                                                    "", titleFont: "", contentFont: "")}
        switch NotificationType(rawValue: notificationType){
        case .watering:
            notificationDisplayed = NotificationDisplayed(id: notification.id ?? UUID() ,title: "\(notification.notificationPlant?.name ?? "") está com sede!",
                                                          description: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon",
                                                          backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
        case .none:
            notificationDisplayed = NotificationDisplayed(id: UUID() ,title: "", description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor: "", titleFont: "", contentFont: "")
        }
        return notificationDisplayed
    }
    static func checkCardNotification(notificationID: UUID, cards: [CardViewModel]) -> [CardViewModel] {
        guard let notificationSelected = Service.notification.notifications.filter({ notification in
            return notification.id == notificationID
        }).first else {return []}
        guard let plant = notificationSelected.notificationPlant else {return []}
        
        Service.notification.updateNotification(notification: notificationSelected, nextTimeToAlert: notificationSelected.nextTimeToAlert ?? "",
                                                timeToAlert: notificationSelected.timeToAlert ?? "", typeToAlert: notificationSelected.typeToAlert ?? "", isResolve: true)
        
        guard let newNotification = Service.notification.createNotification(nextTimeToAlert: Service.notification.calculateNextWatering(wateringFrequency:
                                                                            Frequency(rawValue: plant.watering_frequency!)!),
                                                                            timeToAlert: "", typeToAlert: NotificationType.watering.rawValue) else {return []}
     
        Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
        return cards.filter { cardViewModel in
            return cardViewModel.id != notificationID
        }
    }
}


