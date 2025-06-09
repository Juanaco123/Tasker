//
//  HomeView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
  @State var searchText: String
  
  init(searchText: String = "") {
    self.searchText = searchText
  }
  
  var body: some View {
    VStack(spacing: .zero) {
      VStack {
        HStack {
          TitleByPeriod()
            .padding(.top, .space11x)
          Spacer()
        }
        
        WeekCalendar()
        
        // TODO: Search bar
        HStack {
          Icon(
            image: .systemSearch,
            iconColor: .smoke
          )
          ZStack(alignment: .leading) {
            TextField("", text: $searchText)
            Text(searchText.isEmpty ? "Search your task" : "")
              .foregroundStyle(.smoke)
          }
        }
        .padding(.vertical, .space1x)
        .padding(.leading, .space2x)
        .background(.cloudy)
        .clipShape(.rect(cornerRadius: .radius10))
        .padding(.top, .space3x)
      }
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
