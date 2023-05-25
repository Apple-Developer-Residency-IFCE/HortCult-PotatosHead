//
//  Maneger.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation

protocol Maneger {
    func addVegetable(vegetables: [some Plant]) -> ResponseOptions
    func editVegetable (id: Int, vegetableUpdate: some Plant) -> ResponseOptions
    func getAlerts() ->[Alert]
    func deletePlants(id: Int) -> ResponseOptions
    func getPlants() -> [any Plant]
}
