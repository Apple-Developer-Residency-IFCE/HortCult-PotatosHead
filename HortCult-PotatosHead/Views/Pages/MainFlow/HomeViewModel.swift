import SwiftUI
import Foundation

struct HomeViewModel {
    static func notificationsTextsToDisplay (notification: Notification) -> NotificationDisplayed {
        var notificationDisplayed: NotificationDisplayed
        guard let notificationType =  notification.type_to_alert else {return NotificationDisplayed(id: UUID(),
                                                                                                    title: "",
                                                                                                    description: "",
                                                                                                    icon: "",
                                                                                                    cardColor: "",
                                                                                                    backgroudCardColor: "",
                                                                                                    textColor: "",
                                                                                                    titleFont: "",
                                                                                                    contentFont: "")}
        switch NotificationType(rawValue: notificationType) {
        case .watering:
            notificationDisplayed = NotificationDisplayed(id: notification.id ?? UUID(),
                                                          title: "\(notification.notification_plant?.name ?? "") está com sede!",
                                                          description: "Dê água para a sua plantinha.",
                                                          icon: "Water-Orange", cardColor: "lembreteIcon",
                                                          backgroudCardColor: "AlertCardColor",
                                                          textColor: "TextColor",
                                                          titleFont: "Satoshi-Bold",
                                                          contentFont: "Satoshi-Regular")
        case .none:
            notificationDisplayed = NotificationDisplayed(id: UUID(),
                                                          title: "",
                                                          description: "",
                                                          icon: "",
                                                          cardColor: "",
                                                          backgroudCardColor: "",
                                                          textColor: "",
                                                          titleFont: "",
                                                          contentFont: "")
        }
        return notificationDisplayed
    }
    static func checkCardNotification(notificationID: UUID, cards: [CardViewModel]) -> [CardViewModel] {
        guard let notificationSelected = Service.notification.notifications.filter({ notification in
            return notification.id == notificationID
        }).first else {return []}
        guard let plant = notificationSelected.notification_plant else {return []}
        Service.notification.updateNotification(notification: notificationSelected,
                                                nextTimeToAlert: notificationSelected.next_time_to_alert ?? "",
                                                timeToAlert: notificationSelected.time_to_alert ?? "",
                                                typeToAlert: notificationSelected.type_to_alert ?? "",
                                                isResolve: true)
        guard let newNotification = Service.notification.createNotification(
            nextTimeToAlert: Service.notification.calculateNextWatering(
                wateringFrequency:
                    Frequency(rawValue: plant.watering_frequency!)!),
            timeToAlert: "",
            typeToAlert: NotificationType.watering.rawValue) else {return []}
        Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
        return cards.filter { cardViewModel in
            return cardViewModel.id != notificationID
        }
    }
    static func getReminderCardByDate() -> [Notification] {
    let reminderList = Service.notification.notifications.compactMap({ notification in
            notification
        }).filter { notification in
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: currentDate)
            return(
                !notification.is_resolve && notification.next_time_to_alert
                == dateString && notification.notification_plant != nil
            )
        }
        return reminderList
    }
}
