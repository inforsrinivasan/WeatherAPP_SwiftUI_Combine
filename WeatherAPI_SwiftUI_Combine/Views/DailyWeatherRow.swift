//
//  DailyWeatherRow.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct DailyWeatherRow: View {

    let viewModel: DailyWeatherRowViewModel

    var body: some View {
        HStack(spacing: 10) {
            VStack {
                Text(viewModel.day).font(.system(size: 28, weight: .regular))
                Text(viewModel.month)
            }
            VStack(alignment: .leading, spacing: 0) {
                Text(viewModel.title).font(.system(size: 24, weight: .regular))
                Text(viewModel.fullDescription).font(.system(size: 20, weight: .light))
            }
            Spacer()
            Text("\(viewModel.temperature)°").font(.system(size: 30, weight: .regular))
        }.padding([.leading,.trailing], 10)
    }
}
