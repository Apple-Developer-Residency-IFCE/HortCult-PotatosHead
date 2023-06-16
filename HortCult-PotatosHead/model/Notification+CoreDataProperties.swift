//
//  Notification+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 16/06/23.
//
//

import Foundation
import CoreData


extension Notification {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notification> {
        return NSFetchRequest<Notification>(entityName: "Notification")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var is_resolve: Bool
    @NSManaged public var next_time_to_alert: String?
    @NSManaged public var type_to_alert: String?
    @NSManaged public var time_to_alert: String?
    @NSManaged public var notification_plant: Plant?

}

extension Notification : Identifiable {

}
