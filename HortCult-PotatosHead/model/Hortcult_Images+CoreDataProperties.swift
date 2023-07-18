//
//  Hortcult_Images+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//
//

import Foundation
import CoreData

extension HortCultImages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HortCultImages> {
        return NSFetchRequest<HortCultImages>(entityName: "Hortcult_Images")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var plantImage: Data?
    @NSManaged public var hotcultImagePlants: Plant?

}

extension HortCultImages: Identifiable {

}
