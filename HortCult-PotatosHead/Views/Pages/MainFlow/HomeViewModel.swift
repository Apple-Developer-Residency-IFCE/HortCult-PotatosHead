import SwiftUI
import Foundation

struct NotificationDisplayed {
    let title: String
    let description: String
    let icon: String
    let cardColor: String
    let backgroudCardColor: String
    let textColor: String
    let titleFont: String
    let contentFont: String
}

struct HomeViewModel {
    static func notificationsTextsToDisplay (notification: Notification) -> NotificationDisplayed{
        var notificationDisplayed: NotificationDisplayed
        guard let notificationType =  notification.type_to_alert else {return NotificationDisplayed(title: "", description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor: "", titleFont: "", contentFont: "")}
        switch NotificationType(rawValue: notificationType){
        case .watering:
            notificationDisplayed = NotificationDisplayed(title: "\(notification.notification_plant?.name ?? "") está com sede!", description: "Dê água para a sua plantinha.", icon: "Water-Orange", cardColor: "lembreteIcon", backgroudCardColor: "AlertCardColor", textColor: "TextColor", titleFont: "Satoshi-Bold", contentFont: "Satoshi-Regular")
            
            
        case .none:
            notificationDisplayed = NotificationDisplayed(title: "", description: "", icon: "", cardColor: "", backgroudCardColor: "", textColor: "", titleFont: "", contentFont: "")
        }
        return notificationDisplayed
    }
}


