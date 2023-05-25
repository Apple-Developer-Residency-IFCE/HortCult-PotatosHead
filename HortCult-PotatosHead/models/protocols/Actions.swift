//
//  Actions.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation

protocol Actions {
    func nextWatering() -> String
    func watering() -> ResponseOptions
    func genereteAlerts() -> [Alert]
}
