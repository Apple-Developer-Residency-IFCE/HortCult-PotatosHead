//
//  ImagesViewModel.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//

import Foundation
import CoreData

class ImageService: ObservableObject {
    let viewContext = PersistenceController.shared.container.viewContext
    @Published var hortcultImages: [HortCultImages] = []
    static var instance = ImageService()
    private init() {
        fetch()
    }
    func fetch() {
        let fetchRequest: NSFetchRequest<HortCultImages> = HortCultImages.fetchRequest()
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
        hortcultImages = fetchedNotifications
    }
    func createImage(plantImage: Data) -> HortCultImages? {
        let newImage = HortCultImages(context: viewContext)
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
    func deleteImage(plantImage: HortCultImages) {
        viewContext.delete(plantImage)
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("Could not delete. \(error), \(error.userInfo)")
        }
    }
    func updateImage(plantImage: HortCultImages, updatedImage: Data) {
        plantImage.plant_image = updatedImage
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
}
