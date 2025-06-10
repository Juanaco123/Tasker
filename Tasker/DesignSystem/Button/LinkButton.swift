//
//  LinkButton.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 9/06/25.
//

import SwiftUI
import Foundation

struct LinkButton: View {
  var leadingIcon: ImageResource?
  var text: String
  var trailingIcon: ImageResource?
  var color: Color = .picton
  var action: () -> Void = {}
  
  
  init(
    leadingIcon: ImageResource? = nil,
    text: String,
    trailingIcon: ImageResource? = nil,
    color: Color = .picton,
    action: @escaping () -> Void = {},
  ) {
    self.leadingIcon = leadingIcon
    self.text = text
    self.trailingIcon = trailingIcon
    self.color = color
    self.action = action
  }
  
  var body: some View {
    Button {
      action()
    } label: {
      HStack(spacing: .zero) {
        if let leadingIcon = leadingIcon {
          Icon(image: leadingIcon, iconColor: color)
        }
        Text(text)
          .font(.system(size: 20, weight: .regular))
          .foregroundStyle(color)
        if let trailingIcon = trailingIcon {
          Icon(image: trailingIcon, iconColor: color)
        }
      }
    }
  }
}

#Preview {
  LinkButton(
    leadingIcon: .systemChevronLeft,
    text: "Return",
    trailingIcon: .systemChevronRight,
    color: .priceton
  )
}
