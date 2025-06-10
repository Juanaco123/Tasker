//
//  ContentView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/25.
//

import Foundation
import SwiftUI

struct ContentView: View {
  @State var currentTab: Int = 0
  
  var body: some View {
    ZStack {
      TabView(selection: $currentTab) {
        views
      }
      .animation(.easeInOut(duration: 0.5), value: currentTab)
      
      GeometryReader { geometry in
        VStack {
          Spacer()
          TabBarView(
            selectedIndex: $currentTab,
            items: tabItems,
            extraBottomPadding: geometry.safeAreaInsets.bottom
          )
        }
      }
    }
  }
  
  @ViewBuilder
  private var views: some View {
    let views: [AnyView] = [
      AnyView(HomeView(currentTab: $currentTab)),
      AnyView(TasksView()),
      AnyView(Text("Calendar")),
      AnyView(Text("Add new task"))
    ]
    
    ForEach(Array(views.enumerated()), id: \.offset) { index, view in
      view.tag(index)
        .opacity(currentTab == index ? 1 : 0)
    }
  }
  
  private var tabItems: [TabBarItem] {
    [
      TabBarItem(icon: .systemHome, selectedIcon: .systemHomeFill),
      TabBarItem(icon: .systemList, selectedIcon: .systemListFill),
      TabBarItem(icon: .systemCalendar, selectedIcon: .systemCalendarFill),
      TabBarItem(icon: .systemPlus, selectedIcon: .systemPlusFill)
    ]
  }
}

#Preview {
  ContentView()
}
