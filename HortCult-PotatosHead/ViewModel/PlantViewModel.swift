//
//  PlantViewModel.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 13/06/23.
//

import Foundation
import CoreData

class PlantViewModel: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var plants: [Plant] = []
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Plant> = Plant.fetchRequest()
        guard let fetchedPlants = try? viewContext.fetch(fetchRequest) else {
            return
        }
        plants = fetchedPlants
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
    
    func updatePlant(plant:Plant,name: String, category: String, information: String, watering_frequency: String){
        
        plant.category = category
        plant.information = information
        plant.name = name
        plant.watering_frequency = watering_frequency
        
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func addNotificationToPlant(plant: Plant, notification: Notification ) {
        plant.addToPlant_notification(notification)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func removeNotificationToPlant(plant: Plant, notification: Notification ) {
        plant.removeFromPlant_notification(notification)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
}
