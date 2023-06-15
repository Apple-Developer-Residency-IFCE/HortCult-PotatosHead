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
    @Published var notifications: [Notifications] = []
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Notifications> = Notifications.fetchRequest()
        guard let fetchedNotifications = try? viewContext.fetch(fetchRequest) else {
            return
        }
        notifications = fetchedNotifications
    }
    
    func createPlant(name: String, category: String, information: String, watering_frequency: String) {
            
        let newPlant = Plant(context: viewContext)
        newPlant.id = UUID()
        newPlant.category = category
        newPlant.information = information
        newPlant.name = name
        newPlant.watering_frequency = watering_frequency
        
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func deletePlant(plant: Plant) {
        viewContext.delete(plant)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    func updatePlant(plant:Plant,name: String?, category: String?, information: String?, watering_frequency: String?){
        
        plant.category = (category != nil) ? category : plant.category
        plant.information = (information != nil) ? information : plant.information
        plant.name = (name != nil) ? name : plant.name
        plant.watering_frequency = (watering_frequency != nil) ? watering_frequency : plant.watering_frequency
        
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
        
    }
}
