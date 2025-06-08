//
//  TabBarView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

struct TabBarView: View {
  @Binding var currentIndex: Int
  var items: [TabBarItem]
  
  init(
    currentIndex: Binding<Int>,
    items: [TabBarItem] = []
  ) {
    self._currentIndex = currentIndex
    self.items = items
  }
  
  var body: some View {
    
  }
}
