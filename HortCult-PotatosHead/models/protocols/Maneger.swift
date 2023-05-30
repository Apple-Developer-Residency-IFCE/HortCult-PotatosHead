//
//  Maneger.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation

protocol Maneger {
    associatedtype Item
    func addElement(element: Item) -> ResponseOptions
    func editElement (id: Int, element: Item) -> ResponseOptions
    func getAlerts() ->[Alert]
    func deleteElements(id: Int) -> ResponseOptions
    func getElements() -> [Item]
}
