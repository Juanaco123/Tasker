//
//  Item.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/25.
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
