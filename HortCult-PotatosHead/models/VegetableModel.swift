//
//  VegetableModel.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation
import SwiftUI

struct VegetableModel: Actions, Plant {
    var images: [Image]
    
    let id: Int
    
    var name: String
    
    var description: String
    
    var category: CategoryPlantOptions
    
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
