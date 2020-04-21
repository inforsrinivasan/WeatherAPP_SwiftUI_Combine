//
//  CurrentWeatherService.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-21.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import Combine

class CurrentWeatherService: ObservableObject {

    let weatherFetcher: WeatherFetchable
    let city: String
    private var anyCancellable = Set<AnyCancellable>()
    @Published var response: CurrentWeatherDetailViewModel? = nil

    init(weatherFetcher: WeatherFetchable, city: String) {
        self.weatherFetcher = weatherFetcher
        self.city = city
    }

    func fetchCurrentWeatherDetails() {
        weatherFetcher.currentWeatherForecast(city: city)
            .map { [unowned self] in return CurrentWeatherDetailViewModel(currentWeatherForecastResponse: $0, city: self.city) }
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .finished:
                    break
                case .failure:
                    self.response = nil
                }
            }) { [weak self] currentWeatherDetailViewModel in
                guard let self = self else { return }
                self.response = currentWeatherDetailViewModel
        }.store(in: &anyCancellable)
    }

}
