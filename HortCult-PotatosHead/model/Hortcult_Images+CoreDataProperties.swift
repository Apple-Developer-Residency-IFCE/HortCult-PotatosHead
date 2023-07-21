//
//  Hortcult_Images+CoreDataProperties.swift
//  HortCult-PotatosHead
//
//  Created by carlos amorim on 26/06/23.
//
//

import Foundation
import CoreData


extension Hortcult_Images {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Hortcult_Images> {
        return NSFetchRequest<Hortcult_Images>(entityName: "Hortcult_Images")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var plant_image: Data?
    @NSManaged public var hotcult_images_plants: Plant?

}

extension Hortcult_Images : Identifiable {

}
