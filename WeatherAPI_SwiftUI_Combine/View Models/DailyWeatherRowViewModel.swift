//
//  DailyWeatherRowViewModel.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct DailyWeatherRowViewModel: Identifiable {

    private let item: WeeklyForecastResponse.Item

    var id: String {
      return day + temperature + title
    }

    var day: String {
        return dayFormatter.string(from: item.date)
    }

    var month: String {
        return monthFormatter.string(from: item.date)
    }

    var temperature: String {
        return String(format: "%.1f", item.main.temp)
    }

    var title: String {
        return item.weather.first?.main.rawValue ?? ""
    }

    var fullDescription: String {
        return item.weather.first?.weatherDescription ?? ""
    }

    init(item: WeeklyForecastResponse.Item) {
        self.item = item
    }

}

// Used to hash on just the day in order to produce a single view model for each
// day when there are multiple items per each day.
extension DailyWeatherRowViewModel: Hashable {
  static func == (lhs: DailyWeatherRowViewModel, rhs: DailyWeatherRowViewModel) -> Bool {
    return lhs.day == rhs.day
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(self.day)
  }
}
