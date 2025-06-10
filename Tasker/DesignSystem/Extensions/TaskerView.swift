//
//  TaskerView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 9/06/25.
//

import SwiftUI

struct ScreenConfiguration {
  var withNavBar: Bool = false
  var withLeadingContent: Bool = false
  var withTrailingContent: Bool = false
  var navItem: NavItem?
  var title: String?
  var leadingAction: () -> Void
  var trailingAction: () -> Void
  
  init(
    withNavBar: Bool = false,
    withLeadingContent: Bool = false,
    withTrailingContent: Bool = false,
    navItem: NavItem? = nil,
    title: String? = nil,
    leadingAction: @escaping () -> Void = {},
    trailingAction: @escaping () -> Void = {},
  ) {
    self.withNavBar = withNavBar
    self.withLeadingContent = withLeadingContent
    self.withTrailingContent = withTrailingContent
    self.navItem = navItem
    self.title = title
    self.leadingAction = leadingAction
    self.trailingAction = trailingAction
  }
}

protocol TaskerView: View {
  associatedtype body: View
  
  var screenConfiguration: ScreenConfiguration { get }
}

struct TaskerContainer<Content: View>: View {
  var screenConfiguration: ScreenConfiguration
  var content: () -> Content
  
  var body: some View {
    if screenConfiguration.withNavBar {
      NavBar(
        text: screenConfiguration.title ?? "",
        leadingItem: NavItem(
          leadingIcon: screenConfiguration.navItem?.leadingIcon,
          leadingText: screenConfiguration.navItem?.leadingText ?? "",
          trailingText: screenConfiguration.navItem?.trailingText ?? "",
          trailingIcon: screenConfiguration.navItem?.leadingIcon
        )
      )
      .zIndex(1)
      .frame(alignment: .topLeading)
    }
    content()
  }
}
