//
//  Icon.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

struct Icon: View {
  var image: ImageResource
  var iconColor: Color
  var width: CGFloat
  var height: CGFloat
  
  init(
    image: ImageResource,
    iconColor: Color = .black,
    width: CGFloat = .space6x,
    height: CGFloat = .space6x,
  ) {
    self.image = image
    self.iconColor = iconColor
    self.width = width
    self.height = height
  }
  
  
  var body: some View {
    VStack {
      Image(image)
        .renderingMode(.template)
        .resizable()
        .scaledToFit()
        .foregroundStyle(iconColor)
    }
    .frame(width: width, height: height)
  }
}

#Preview {
  Icon(image: .systemSun, iconColor: .yellow)
}
