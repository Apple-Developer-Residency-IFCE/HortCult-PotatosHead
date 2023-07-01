//
//  PlantViewModel.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 13/06/23.
//

import Foundation
import CoreData
import UIKit
import SwiftUI

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
    
    init() {
        fetch()
    }
    
    func createPlant(name: String, category: String, information: String, watering_frequency: String) -> Plant? {
            
        let newPlant = Plant(context: viewContext)
        newPlant.id = UUID()
        newPlant.category = category
        newPlant.information = information
        newPlant.name = name
        newPlant.watering_frequency = watering_frequency
        
        do {
            try viewContext.save()
            fetch()
            return newPlant
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
            return nil
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
    
    func addImageToPlant(plant: Plant, plantImage: Hortcult_Images){
        plant.addToPlant_hortcult_images(plantImage)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    func removeImageToPlant(plant:Plant, plantImage: Hortcult_Images){
        plant.removeFromPlant_hortcult_images(plantImage)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func getPlantImages(plant:Plant) -> [Image] {
        let arrayImages: [Data] = (plant.plant_hortcult_images?.allObjects.compactMap({ image in
            let imageData = image as! Hortcult_Images
            return imageData.plant_image
        }))!
        
        let uiImageArray = arrayImages.compactMap { image in
            return UIImage(data: image)
        }
        
        let plantImages = uiImageArray.map { UIImage in
            return Image(uiImage: UIImage)
        }
        
        return plantImages
    }
    
    func getPlantImagesData(plant:Plant) -> [Data] {
        let arrayImages: [Data] = (plant.plant_hortcult_images?.allObjects.compactMap({ image in
            let imageData = image as! Hortcult_Images
            return imageData.plant_image
        }))!
        
        return arrayImages
    }
}



