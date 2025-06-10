//
//  TitleByPeriod.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 8/06/25.
//

import SwiftUI
import Foundation

private enum TimePeriod {
  case morning, afternoon, night
}

struct TitleByPeriod: View {
  var body: some View {
    VStack(alignment: .leading, spacing: .zero) {
      if timePeriod() == .morning {
        HStack {
          Text("Good")
            .font(.system(size: 34))
            .fontWeight(.bold)
          Text("morning")
            .foregroundStyle(.canary)
            .font(.system(size: 34))
            .fontWeight(.bold)
        }
        
        HStack {
          Text("Have a nice")
            .font(.system(size: 28))
            .fontWeight(.regular)
          Text("day!")
            .foregroundStyle(.canary)
            .font(.system(size: 28))
            .fontWeight(.regular)
          Icon(
            image: .systemSun,
            iconColor: .canary
          )
        }
        
      } else if timePeriod() == .afternoon {
        HStack {
          Text("Good")
            .font(.system(size: 34))
            .fontWeight(.bold)
          Text("afternoon")
            .foregroundStyle(.priceton)
            .font(.system(size: 34))
            .fontWeight(.bold)
        }
        
        HStack {
          Text("Have you taken a")
            .font(.system(size: 28))
            .fontWeight(.regular)
          Text("break yet?")
            .foregroundStyle(.priceton)
            .font(.system(size: 28))
            .fontWeight(.regular)
          Icon(
            image: .systemMiddaySun,
            iconColor: .priceton
          )
        }
        .lineLimit(1)
        .minimumScaleFactor(0.6)
        
      } else {
        HStack {
          Text("Good")
            .font(.system(size: 34))
            .fontWeight(.bold)
          Text("morning")
            .foregroundStyle(.night)
            .font(.system(size: 34))
            .fontWeight(.bold)
        }
        HStack {
          Text("Have a nice")
            .font(.system(size: 28))
            .fontWeight(.regular)
          Text("day!")
            .foregroundStyle(.night)
            .font(.system(size: 28))
            .fontWeight(.regular)
          Icon(
            image: .systemMoon,
            iconColor: .night
          )
        }
      }
    }
  }
}

private func timePeriod() -> TimePeriod {
  let hour: Int = Calendar.current.component(.hour, from: Date())
  
  switch hour {
    case 5..<12:
    return .morning
  case 12..<19:
    return .afternoon
  default:
    return .night
  }
}
