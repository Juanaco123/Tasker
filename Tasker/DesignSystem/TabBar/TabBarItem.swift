//
//  TabBarItem.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

struct TabBarItem: Identifiable {
  var id: UUID = UUID()
  var icon: ImageResource
  
  init(icon: ImageResource) {
    self.icon = icon
  }
}
