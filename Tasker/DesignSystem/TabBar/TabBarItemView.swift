//
//  TabBarItemView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

struct TabBarItemView: View {
  var item: TabBarItem
  var isSelected: Bool
  
  init(
    item: TabBarItem,
    isSelected: Bool
  ) {
    self.item = item
    self.isSelected = isSelected
  }
  
  var body: some View {
    VStack {
      Icon(
        image: isSelected ? item.selectedIcon : item.icon,
        iconColor: isSelected ? .lime : .smoke
      )
    }
  }
}

#Preview {
  HStack {
    TabBarItemView(item: TabBarItem(icon: .systemHome, selectedIcon: .systemHomeFill), isSelected: false)
    TabBarItemView(item: TabBarItem(icon: .systemHome, selectedIcon: .systemHomeFill), isSelected: true)
  }
}
