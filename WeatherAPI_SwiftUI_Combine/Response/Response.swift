//
//  WeeklyForecastResponse.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

struct WeeklyForecastResponse: Decodable {

    let list: [Item]

    struct Item: Decodable {
        let date: Date
        let main: MainClass
        let weather: [Weather]

        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case main
            case weather
        }
    }


    struct MainClass: Decodable {
        let temp: Double
    }

    struct Weather: Decodable {
        let main: MainEnum
        let weatherDescription: String

        enum CodingKeys: String, CodingKey {
            case main
            case weatherDescription = "description"
        }
    }

    enum MainEnum: String, Decodable {
        case clear = "Clear"
        case clouds = "Clouds"
        case rain = "Rain"
    }
}

struct CurrentWeatherForecastResponse: Decodable {
  let coord: Coord
  let main: Main

  struct Main: Codable {
    let temperature: Double
    let humidity: Int
    let maxTemperature: Double
    let minTemperature: Double

    enum CodingKeys: String, CodingKey {
      case temperature = "temp"
      case humidity
      case maxTemperature = "temp_max"
      case minTemperature = "temp_min"
    }
  }

  struct Coord: Decodable {
    let lon: Double
    let lat: Double
  }
}

