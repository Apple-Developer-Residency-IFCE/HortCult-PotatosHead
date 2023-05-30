//
//  VegetableModel.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation
import SwiftUI
import CoreData

@objc(VegetableModel)
class VegetableModel: NSObject, Actions, Plant, NSFetchRequestResult {
    var images: [Image]
    
    let id: Int
    
    var name: String
    
    var description2: String
    
    var category: CategoryPlantOptions
    
    init(images: [Image], id: Int, name: String, description2: String, category: CategoryPlantOptions) {
        self.images = images
        self.id = id
        self.name = name
        self.description2 = description2
        self.category = category
    }
    
    func nextWatering() -> String {
        return "Implementar"
    }
    
    func watering() -> ResponseOptions {
        return .success
    }
    
    func genereteAlerts() -> [Alert] {
        return []
    }
    
    
}

class Cebolitos: NSObject, NSFetchRequestResult {
    var name: String
    var idade: String
    
    init(name: String, idade: String) {
        self.name = name
        self.idade = idade
    }
}
