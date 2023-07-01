//
//  ImagesViewModel.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//

import Foundation
import CoreData

class ImageViewModel: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var hortcult_images: [Hortcult_Images] = []
    
    init() {
        fetch()
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<Hortcult_Images> = Hortcult_Images.fetchRequest()
        let myEntititesRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: "Hortcult_Images")
        let plants =   NSFetchRequest<NSFetchRequestResult>(entityName: "Plant")
        do {
            let entities = try viewContext.fetch(myEntititesRequest)
            let plants = try viewContext.fetch(plants)
            print(entities)
            print(plants)
            
        } catch {
            
        }
        guard let fetchedNotifications = try? viewContext.fetch(fetchRequest) else {
            return
        }
        hortcult_images = fetchedNotifications
    }
    
    
    func createImage(plantImage: Data) -> Hortcult_Images? {
            
        let newImage = Hortcult_Images(context: viewContext)
        newImage.id = UUID()
        newImage.plant_image = plantImage
        
        do {
            try viewContext.save()
            fetch()
            return newImage
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
            return nil
        }
    }
    
    func deleteImage(plantImage: Hortcult_Images) {
        viewContext.delete(plantImage)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    
    func updateImage(plantImage:Hortcult_Images, updatedImage: Data){
        
        plantImage.plant_image = updatedImage
        
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
}
