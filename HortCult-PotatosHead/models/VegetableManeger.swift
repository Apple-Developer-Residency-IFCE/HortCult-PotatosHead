//
//  VegetableManeger.swift
//  HortCult-PotatosHead
//
//  Created by userext on 26/05/23.
//

import Foundation
import CoreData

struct VegetableManeger: Maneger {
    typealias Item = VegetableModel
    let container: NSPersistentContainer
    init(){
        self.container = NSPersistentContainer(name: "HortCult_PotatosHead")
        container.loadPersistentStores { _, _ in }
    }
    
    func addElement(element: VegetableModel) -> ResponseOptions {
        return .failure
    }
    
    func editElement(id: Int, element: VegetableModel) -> ResponseOptions {
        return .failure
    }
    
    func getAlerts() -> [Alert] {
        var alerts: [Alert] = []
        var plants: [VegetableModel] = self.getElements()
        plants.forEach(){ plant in
            plant.genereteAlerts().forEach( { element in
                alerts.append(element)
            })
        }
        return alerts
    }
    
    func deleteElements(id: Int) -> ResponseOptions {
        return .failure
    }
    
    func getElements() -> [VegetableModel] {
        <#code#>
    }
    
    
    
    
    
    
    
}
