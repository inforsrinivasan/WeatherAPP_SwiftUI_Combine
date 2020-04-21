//
//  CurrentWeatherViewModel.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-21.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import CoreLocation

struct CurrentWeatherDetailViewModel {

    let currentWeatherForecastResponse: CurrentWeatherForecastResponse
    let city: String

    init(currentWeatherForecastResponse: CurrentWeatherForecastResponse, city: String) {
        self.currentWeatherForecastResponse = currentWeatherForecastResponse
        self.city = city
    }

    var temprature: String {
        return "\(currentWeatherForecastResponse.main.temperature)"
    }

    var maxTemperature: String {
        return "\(currentWeatherForecastResponse.main.maxTemperature)"
    }

    var minTemperature: String {
        return "\(currentWeatherForecastResponse.main.maxTemperature)"
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: currentWeatherForecastResponse.coord.lat, longitude: currentWeatherForecastResponse.coord.lon)
    }

}
