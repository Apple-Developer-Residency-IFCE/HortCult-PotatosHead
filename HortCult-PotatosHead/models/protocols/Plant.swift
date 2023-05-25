//
//  Plant.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation
import SwiftUI

protocol Plant {
    var name: String { get set }
    var description: String { get set }
    var category: CategoryPlantOptions { get set }
    var images: [Image] { get set }
}
