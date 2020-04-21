//
//  WeeklyWeatherViewModel.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import Combine

class WeeklyWeatherViewModel: ObservableObject, Identifiable {

    @Published var city: String = ""
    @Published var dataSource: [DailyWeatherRowViewModel] = []

    let weatherFetcher: WeatherFetchable
    private var anyCancellable = Set<AnyCancellable>()

    init(weatherFetcher: WeatherFetchable, scheduler: DispatchQueue = DispatchQueue(label: "WeatherViewModel")) {
        self.weatherFetcher = weatherFetcher
        $city.dropFirst(1)
            .debounce(for: .seconds(0.5), scheduler: scheduler)
            .sink { [weak self] value in
                guard let self = self else { return }
                self.fetchWeather(city: value)
        }
        .store(in: &anyCancellable)
    }

    private func fetchWeather(city: String) {
        weatherFetcher.weeklyWeatherForecast(city: city)
            .map { $0.list.map { DailyWeatherRowViewModel(item: $0) } }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                guard let self = self else { return }
                switch value {
                case .finished:
                    break
                case .failure:
                    self.dataSource = []
                }
            }) { [weak self] items in
                guard let self = self else { return }
                self.dataSource = Array.removeDuplicates(items)
        }
        .store(in: &anyCancellable)
    }


}
