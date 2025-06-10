//
//  NavBar.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 9/06/25.
//

import SwiftUI
import Foundation

enum navBarStyle {
  case `default`, monocromatic(Color)
}

struct NavItem {
  var leadingIcon: ImageResource?
  var leadingText: String?
  var trailingText: String?
  var trailingIcon: ImageResource?
  
  init(
    leadingIcon: ImageResource? = nil,
    leadingText: String? = nil,
    trailingText: String? = nil,
    trailingIcon: ImageResource? = nil
  ) {
    self.leadingIcon = leadingIcon
    self.leadingText = leadingText
    self.trailingText = trailingText
    self.trailingIcon = trailingIcon
  }
}

struct NavBar: View {
  var text: String
  var leadingItem: NavItem?
  var trailingItem: NavItem?
  var style: navBarStyle = .default
  
  init(
    text: String,
    leadingItem: NavItem? = nil,
    trailingItem: NavItem? = nil,
    style: navBarStyle = .default,
  ) {
    self.text = text
    self.leadingItem = leadingItem
    self.trailingItem = trailingItem
    self.style = style
  }
  
  var body: some View {
    switch style {
    case .default:
      centeredContent()
    case .monocromatic(let color):
      centeredContent(color: color)
    }
  }
  
  @ViewBuilder
  func linkButton(
    leadingIcon: ImageResource? = nil,
    text: String? = nil,
    trailingIcon: ImageResource? = nil,
    color: Color? = nil,
    action: @escaping () -> Void = {}
  ) -> some View {
    LinkButton(
      leadingIcon: leadingIcon,
      text: text ?? "",
      trailingIcon: trailingIcon,
      color: color ?? .black,
      action: action
    )
  }
  
  @ViewBuilder
  private func centeredContent(color: Color? = nil) -> some View {
    ZStack(alignment: .center) {
      HStack(alignment: .center) {
        if let leadingItem = leadingItem {
          linkButton(
            leadingIcon: leadingItem.leadingIcon,
            text: leadingItem.leadingText,
            color: color ?? .picton
          )
        }
        Spacer()
        if let trailingItem = trailingItem {
          linkButton(
            text: trailingItem.trailingText,
            trailingIcon: trailingItem.trailingIcon,
            color: color ?? .picton
          )
        }
      }
      Text(text)
        .foregroundStyle(color ?? .black)
        .font(.system(size: 34, weight: .bold))
    }
  }
}

#Preview {
  NavBar(
    text: "Lorem",
    leadingItem: NavItem(
      leadingIcon: .systemChevronLeft,
      leadingText: "Return",
    ),
    trailingItem: NavItem(
      trailingText: "Add",
      trailingIcon: .systemChevronRight
    ),
//    style: .monocromatic(.priceton)
  )
}
