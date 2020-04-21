//
//  WeatherHome.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct WeatherHome: View {

    @ObservedObject var viewModel: WeeklyWeatherViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                Color.purple.frame(height: 30)
                SearchBar(viewModel: viewModel).frame(height: 80)
                List {
                    Section(header: Text("Current Weather")) {
                        NavigationLink(destination: CurrentWeatherDetailView(service: CurrentWeatherService(weatherFetcher: viewModel.weatherFetcher, city: viewModel.city))) {
                            CurrentWeatherView(viewModel: viewModel)
                        }
                    }
                    Section(header: Text("Weekly Weather")) {
                        ForEach(viewModel.dataSource) { row in
                            DailyWeatherRow(viewModel: row)
                        }
                    }
                }
            }.edgesIgnoringSafeArea(.top).navigationBarTitle("").navigationBarHidden(true)
        }
    }
}

