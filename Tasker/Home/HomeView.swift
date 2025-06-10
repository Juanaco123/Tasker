//
//  HomeView.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 7/06/25.
//

import Foundation
import SwiftUI

struct HomeView: View {
  @Binding private var currentTab: Int
  @State private var searchText: String = ""
  @State private var goToAllTasks: NavigationPath = NavigationPath()
  
  init(currentTab: Binding<Int>) {
    self._currentTab = currentTab
  }
  
  var body: some View {
    NavigationStack(path: $goToAllTasks) {
      VStack(spacing: .zero) {
        VStack {
          HStack {
            TitleByPeriod()
              .padding(.top, .space11x)
            Spacer()
          }
          
          WeekCalendar()
            .onTapGesture {
              currentTab = 2
            }
          
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
        
        ScrollView {
          HStack(spacing: .zero) {
            Text("Task")
              .font(.system(size: 28.0))
              .fontWeight(.semibold)
            Spacer()
            
            Button {
              currentTab = 1
            } label: {
              Text("See all")
                .foregroundStyle(.lime)
              Icon(
                image: .systemChevronRight,
                iconColor: .lime
              )
            }
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
  HomeView(currentTab: .constant(1))
}
