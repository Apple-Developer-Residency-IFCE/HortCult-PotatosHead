//
//  AddInfoScreenViewModel.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 05/07/23.
//

import Foundation

struct AddInfoScreenViewModel {
    static func verifyNotificationToday (date: String) -> Bool {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString == date
    }
    static func setPlantImage(data: Data, newPlant: Plant) {
        guard let newImage = Service.image.createImage(plantImage: data) else {return}
        Service.plant.addImageToPlant(plant: newPlant, plantImage: newImage)
    }
    static func setNewNotification(newPlant: Plant, frequency: Frequency) -> Notification {
        guard let newNotification = Service.notification.createNotification(
            nextTimeToAlert: Service.notification.calculateNextWatering(
                wateringFrequency: frequency),
            timeToAlert: "",
            typeToAlert: NotificationType.watering.rawValue) else {return Notification()}
        Service.plant.addNotificationToPlant(plant: newPlant, notification: newNotification)
        return newNotification
    }
    static func fieldsVerification(frequency: Frequency?,
                                   category: Category?,
                                   nameText: String,
                                   descriptionText: String) -> Bool {
        return !((frequency != nil) && (category != nil) && !nameText.isEmpty && !descriptionText.isEmpty)
    }
    static func createPlant(name: String, categoria: Category?, information: String, frequencia: Frequency?) -> Plant? {
        guard let frequencia = frequencia?.rawValue else {return nil}
        guard let categoria = categoria?.rawValue else {return nil}
        return Service.plant.createPlant(name: name,
                                        category: categoria,
                                        information: information,
                                        wateringFrequency: frequencia)
    }
    static func updatePlant(frequencia: Frequency?,
                            categoria: Category?,
                            name: String,
                            information: String,
                            plant: Plant?) {
        guard let frequencia = frequencia?.rawValue else {return}
        guard let categoria = categoria?.rawValue else {return}
        guard let plant = plant else {return}
        Service.plant.updatePlant(plant: plant,
                                  name: name,
                                  category: categoria,
                                  information: information,
                                  wateringFrequency: frequencia)
    }
    static func updatePlantImage(plant: Plant?, image: Any) {
        guard let imagePlant =
                image as? HortCultImages else {return}
        Service.plant.removeImageToPlant(
            plant: plant!,
            plantImage: imagePlant)
    }
}
