//
//  CurrentWeatherView.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-21.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct CurrentWeatherView: View {

    @ObservedObject var viewModel: WeeklyWeatherViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.city).font(.system(size: 20, weight: .regular))
            Text("Weather Today").font(.system(size: 18, weight: .light))
        }
    }
}
