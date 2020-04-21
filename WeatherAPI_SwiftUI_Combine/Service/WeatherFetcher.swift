//
//  WeatherFetcher.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import Combine

class WeatherFetcher {

    private let session: URLSession

    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
}

extension WeatherFetcher: WeatherFetchable {
    func weeklyWeatherForecast(city: String) -> AnyPublisher<WeeklyForecastResponse, WeatherError> {
        let urlComponments = makeWeekelyForecastComponents(city: city)
        guard let url = urlComponments.url else {
            return Fail(error: WeatherError.URLError).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { _ in WeatherError.NetworkError }
            .flatMap { decode($0.data) }
            .eraseToAnyPublisher()
    }

    func currentWeatherForecast(city: String) -> AnyPublisher<CurrentWeatherForecastResponse, WeatherError> {
        let urlComponents = makeCurrentForecastComponents(city: city)
        guard let url = urlComponents.url else {
            return Fail(error: WeatherError.URLError).eraseToAnyPublisher()
        }
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { _ in WeatherError.NetworkError }
            .flatMap { decode($0.data) }
            .eraseToAnyPublisher()
    }
}

private extension WeatherFetcher {
    func makeWeekelyForecastComponents(city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.path = OpenWeatherAPI.path + "/forecast"
        components.host = OpenWeatherAPI.host
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.key)
        ]
        return components
    }

    func makeCurrentForecastComponents(city: String) -> URLComponents {
        var components = URLComponents()
        components.scheme = OpenWeatherAPI.scheme
        components.path = OpenWeatherAPI.path + "/weather"
        components.host = OpenWeatherAPI.host
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "mode", value: "json"),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "APPID", value: OpenWeatherAPI.key)
        ]
        return components
    }
}
