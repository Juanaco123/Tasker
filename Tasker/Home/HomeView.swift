//
//  HomeView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack(spacing: .zero) {
      HStack {
        TitleByPeriod()
          .padding(.top, .space11x)
        Spacer()
      }
      .applyDefaultPadding()
      
      WeekCalendar()
        .applyDefaultPadding()
      
      NavigationStack {
        ScrollView {
          HStack(spacing: .zero) {
            Text("Task")
              .font(.system(size: 28.0))
              .fontWeight(.semibold)
            Spacer()
            Text("See all")
              .foregroundStyle(.lime)
            Icon(
              image: .systemChevronRight,
              iconColor: .lime
            )
          }
          
          HStack {
            Button {
              
            } label: {
              HStack(spacing: .zero) {
                Text("Personal")
                  .font(.system(size: 16.0))
                  .foregroundStyle(Color.white)
                Icon(
                  image: .systemChevronDown,
                  iconColor: .white
                )
              }
              .padding(.leading, .space2x)
              .padding(.vertical, .space1x)
              .background(Color.picton)
              .clipShape(.rect(cornerRadius: .radius15))
            }
            Spacer()
          }
        }
        .padding(.top, .space6x)
        .padding(.horizontal, .space4x)
      }
    }
  }
}

#Preview {
  HomeView()
}
