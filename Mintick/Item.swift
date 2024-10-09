//
//  Item.swift
//  Mintick
//
//  Created by PeterWind on 10/9/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
