import SwiftUI
import Foundation

struct HomeViewModel {
    static func notificationsTextsToDisplay (notification: Notification) -> NotificationDisplayed{
        var notificationDisplayed: NotificationDisplayed
        guard let notificationType =  notification.type_to_alert else {return NotificationDisplayed(id: UUID() ,title: "", description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor: "", titleFont: "", contentFont: "")}
        switch NotificationType(rawValue: notificationType){
        case .watering:
            notificationDisplayed = NotificationDisplayed(id: notification.id ?? UUID() ,title: "\(notification.notification_plant?.name ?? "") está com sede!", description: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
        
        case .none:
            notificationDisplayed = NotificationDisplayed(id: UUID() ,title: "", description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor: "", titleFont: "", contentFont: "")
        }
        return notificationDisplayed
    }
    
    static func checkCardNotification(notificationID: UUID, cards: [CardViewModel]) -> [CardViewModel] {
        guard let notificationSelected = Service.notification.notifications.filter({ Notification in
            return Notification.id == notificationID
        }).first else {return []}
        
        guard let plant = notificationSelected.notification_plant else {return []}
        
        Service.notification.updateNotification(notification: notificationSelected, next_time_to_alert: notificationSelected.next_time_to_alert ?? "", time_to_alert: notificationSelected.time_to_alert ?? "", type_to_alert: notificationSelected.type_to_alert ?? "", is_resolve: true)
        
        guard let newNotification = Service.notification.createNotification(next_time_to_alert: Service.notification.calculateNextWatering(wateringFrequency: Frequency(rawValue: plant.watering_frequency!)!), time_to_alert: "", type_to_alert: NotificationType.watering.rawValue) else {return []}
     
        Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
        
        return cards.filter { CardViewModel in
            return CardViewModel.id != notificationID
        }
    }
}


