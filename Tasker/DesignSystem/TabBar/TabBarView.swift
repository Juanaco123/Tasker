//
//  TabBarView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

struct TabBarView: View {
  @Binding var selectedIndex: Int
  let items: [TabBarItem]
  var extraBottomPadding: CGFloat
  
  init(
    selectedIndex: Binding<Int>,
    items: [TabBarItem] = [],
    extraBottomPadding: CGFloat = 0.0,
  ) {
    self._selectedIndex = selectedIndex
    self.items = items
    self.extraBottomPadding = extraBottomPadding
  }
  
  var body: some View {
    HStack(spacing: .space10x) {
      ForEach(items.indices, id:\.self) { index in
        Button {
          selectedIndex = index
        } label: {
          TabBarItemView(
            item: items[index],
            isSelected: selectedIndex == index
          )
        }
      }
    }
    .padding(.top, .space3x)
    .padding(.bottom, extraBottomPadding)
    .frame(maxWidth: .infinity)
    .background(Color.cloudy)
  }
}

#Preview {
  let items: [TabBarItem] = [
    TabBarItem(icon: .systemSun, selectedIcon: .systemSun),
    TabBarItem(icon: .systemSun, selectedIcon: .systemSun),
    TabBarItem(icon: .systemSun, selectedIcon: .systemSun),
    TabBarItem(icon: .systemSun, selectedIcon: .systemSun),
  ]
  TabBarView(
    selectedIndex: .constant(0),
    items: items,
  )
}
