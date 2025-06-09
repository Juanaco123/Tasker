//
//  WeekCalendar.swift
//  Tasker
//
//  Created by Juan Camilo Victoria Pacheco on 9/06/25.
//

import SwiftUI
import Foundation

struct WeekCalendar: View {
  private let calendar: Calendar = Calendar.current
  
  private var dayNames: [String] = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ]
  
  private var weekDates: [Date] {
    let calendar: Calendar = Calendar.current
    let today: Date = Date()
    let weekday: Int = calendar.component(.weekday, from: today)
    let dayToSubstract: Int = (weekday + 5) % 7
    
    guard let startOfWeek = calendar.date(byAdding: .day, value: -dayToSubstract, to: today) else {
      return []
    }
    
    return (0..<7).compactMap { offset in
      calendar.date(byAdding: .day, value: offset, to: startOfWeek)
    }
  }
  
  var body: some View {
    let currentDay: Date = calendar.startOfDay(for: Date())
    
    HStack(spacing: .space3x) {
      ForEach(Array(zip(dayNames, weekDates)), id: \.0) { dayName, date in
        let isToday: Bool = calendar.isDate(currentDay, inSameDayAs: date)
        
        if isToday {
          VStack {
            Text(dayName.prefix(3))
            Text("\(calendar.component(.day, from: date))")
          }
          .foregroundStyle(Color.white)
          .padding(.vertical, .space3x)
          .padding(.horizontal, .space1x)
          .background(Color.lime)
          .clipShape(.rect(cornerRadius: .radius10))
          
        } else {
          VStack {
            Text(dayName.prefix(3))
            Text("\(calendar.component(.day, from: date))")
          }
          .foregroundStyle(Color.smoke)
        }
      }
    }
    .lineLimit(1)
    .minimumScaleFactor(0.85)
    .font(.system(size: 22, weight: .bold))
    .padding(.vertical, .space2x)
    .padding(.horizontal, .space3x)
    .frame(maxWidth: .infinity)
    .background(Color.cloudy)
    .clipShape(.rect(cornerRadius: .radius10))
  }
}

#Preview {
  WeekCalendar()
    .applyDefaultPadding()
}
