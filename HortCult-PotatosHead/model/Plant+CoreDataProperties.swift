//
//  Plant+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//
//

import Foundation
import CoreData


extension Plant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Plant> {
        return NSFetchRequest<Plant>(entityName: "Plant")
    }

    @NSManaged public var category: String?
    @NSManaged public var id: UUID?
    @NSManaged public var images: Date?
    @NSManaged public var information: String?
    @NSManaged public var name: String?
    @NSManaged public var watering_frequency: String?
    @NSManaged public var plant_notification: NSSet?
    @NSManaged public var plant_hortcult_images: NSSet?

}

// MARK: Generated accessors for plant_notification
extension Plant {

    @objc(addPlant_notificationObject:)
    @NSManaged public func addToPlant_notification(_ value: Notification)

    @objc(removePlant_notificationObject:)
    @NSManaged public func removeFromPlant_notification(_ value: Notification)

    @objc(addPlant_notification:)
    @NSManaged public func addToPlant_notification(_ values: NSSet)

    @objc(removePlant_notification:)
    @NSManaged public func removeFromPlant_notification(_ values: NSSet)

}

// MARK: Generated accessors for plant_hortcult_images
extension Plant {

    @objc(addPlant_hortcult_imagesObject:)
    @NSManaged public func addToPlant_hortcult_images(_ value: HortCultImages)

    @objc(removePlant_hortcult_imagesObject:)
    @NSManaged public func removeFromPlant_hortcult_images(_ value: HortCultImages)

    @objc(addPlant_hortcult_images:)
    @NSManaged public func addToPlant_hortcult_images(_ values: NSSet)

    @objc(removePlant_hortcult_images:)
    @NSManaged public func removeFromPlant_hortcult_images(_ values: NSSet)

}

extension Plant : Identifiable {

}
