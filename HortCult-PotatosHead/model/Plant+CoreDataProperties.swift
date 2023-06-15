//
//  Plant+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 14/06/23.
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
    @NSManaged public var images: Data?
    @NSManaged public var information: String?
    @NSManaged public var name: String?
    @NSManaged public var watering_frequency: String?

}

extension Plant : Identifiable {

}
