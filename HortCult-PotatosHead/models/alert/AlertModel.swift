//
//  AlertModel.swift
//  HortCult-PotatosHead
//
//  Created by userext on 25/05/23.
//

import Foundation

struct Alert {
    public var name: String
    public var description: String
    public var status: StatusOptions
    
    init(name: String, description: String, status: StatusOptions){
        self.name = name
        self.description = description
        self.status = status
    }
    
}
