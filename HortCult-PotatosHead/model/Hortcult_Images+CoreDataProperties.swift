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
// swiftlint:disable identifier_name line_length 2
    @NSManaged public var plant_image: Data?
    @NSManaged public var hotcult_images_plants: Plant?

}

extension HortCultImages : Identifiable {

}
