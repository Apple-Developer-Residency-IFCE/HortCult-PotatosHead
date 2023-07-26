//
//  AddInfoScreenViewModel.swift
//  HortCult-PotatosHead
//
//  Created by Caio Vinicius on 05/07/23.
//

import Foundation

struct AddInfoScreenViewModel {
    static func verifyNotificationToday (date: String) -> Bool {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: currentDate)
        return dateString == date
    }
}
