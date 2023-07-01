//
//  PlantViewModel.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 13/06/23.
//

import Foundation
import CoreData

class NotificationViewModel: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var notifications: [Notification] = []
    
    
    init() {
        fetch()
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Notification> = Notification.fetchRequest()
        guard let fetchedNotifications = try? viewContext.fetch(fetchRequest) else {
            return
        }
        notifications = fetchedNotifications
    }
    
    func createNotification(next_time_to_alert: String, time_to_alert: String,  type_to_alert: String) -> Notification? {
            
        let newNotification = Notification(context: viewContext)
        newNotification.id = UUID()
        newNotification.is_resolve = false
        newNotification.next_time_to_alert = next_time_to_alert
        newNotification.time_to_alert = time_to_alert
        newNotification.type_to_alert = type_to_alert
        
        do {
            try viewContext.save()
            fetch()
            return newNotification
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
            return nil
        }
    }
    
    func deleteNotification(notification: Notification) {
        viewContext.delete(notification)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    func updateNotification(notification:Notification,next_time_to_alert: String, time_to_alert: String, type_to_alert: String, is_resolve: Bool){
        
        notification.is_resolve = is_resolve
        notification.next_time_to_alert = next_time_to_alert
        notification.time_to_alert = time_to_alert
        notification.type_to_alert = type_to_alert
        
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
        
    }
    
    func getUnresolvedsNotifications() -> [Notification]{
        return notifications.filter { element in
            return element.is_resolve == false
        }
    }
    
    func calculateNextWatering(wateringFrequency: Frequency) -> String {
        let currentDate = Date()
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
       var dateString = ""
        
        switch wateringFrequency {
            case .daily:
                let daily = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)
                dateString = dateFormatter.string(from: daily ?? Date())
            
        case.everyTwoDays:
            let twoDaysFromNow = Calendar.current.date(byAdding: .day, value: 2, to: currentDate)
            dateString = dateFormatter.string(from: twoDaysFromNow ?? Date())
            
            case .everyFourDays:
                let fourDaysFromNow = Calendar.current.date(byAdding: .day, value: 4, to: currentDate)
                dateString = dateFormatter.string(from: fourDaysFromNow ?? Date())
            
            case .weekly:
                let weekly = Calendar.current.date(byAdding: .day, value: 7, to: currentDate)
                dateString = dateFormatter.string(from: weekly ?? Date())
        }
        return dateString
    }
}
