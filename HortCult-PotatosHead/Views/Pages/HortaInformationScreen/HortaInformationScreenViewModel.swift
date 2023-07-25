//
//  HortaInformationScreenViewModel.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 24/07/23.
//

import Foundation
import SwiftUI

class HortaInformationScreenViewModel {
    static func unrwappedPlantName (plant: Plant) -> String {
        return plant.name ?? "NAO TEM NOME"
    }
    static func updateNotification(activeNotification: Notification) {
        Service.notification.updateNotification(
            notification: activeNotification,
            nextTimeToAlert: activeNotification.next_time_to_alert!,
            timeToAlert: activeNotification.time_to_alert!,
            typeToAlert: activeNotification.type_to_alert!,
            isResolve: true)
    }
    static func createNewNotification(plant: Plant) {
        guard let newNotification = Service.notification.createNotification(
            nextTimeToAlert:
                Service.notification.calculateNextWatering(
                    wateringFrequency: Frequency(rawValue: plant.watering_frequency!)!),
            timeToAlert: "",
            typeToAlert: NotificationType.watering.rawValue) else {return}
        Service.plant.addNotificationToPlant(plant: plant, notification: newNotification)
    }
    static func getHortaType(plant: Plant) -> String {
        return plant.category ?? "NAO TEM CATEGORIA"
    }
    static func getPlantInformation(plant: Plant) -> String {
        return plant.information ?? "NAO TEM INFO"
    }
    static func getPlantWateringFrequency(plant: Plant) -> String {
        guard let freq = plant.watering_frequency else {return ""}
         return freq
    }
}
