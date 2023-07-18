//
//  Notification+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//
//

import Foundation
import CoreData

extension Notification {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notification> {
        return NSFetchRequest<Notification>(entityName: "Notification")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isResolve: Bool
    @NSManaged public var nextTimeToAlert: String?
    @NSManaged public var timeToAlert: String?
    @NSManaged public var typeToAlert: String?
    @NSManaged public var notificationPlant: Plant?

}

extension Notification: Identifiable {
}
