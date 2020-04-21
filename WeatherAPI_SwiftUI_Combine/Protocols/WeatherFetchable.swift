//
//  WeatherFetcher.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import Combine

protocol WeatherFetchable {
    func weeklyWeatherForecast(city: String) -> AnyPublisher<WeeklyForecastResponse, WeatherError>
    func currentWeatherForecast(city: String) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError>
}

