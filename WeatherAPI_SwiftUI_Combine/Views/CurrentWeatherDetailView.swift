//
//  CurrentWeatherDetailView.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-21.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI
import MapKit

struct CurrentWeatherDetailView: View {

    @ObservedObject var service: CurrentWeatherService

    var body: some View {

        VStack(alignment: .leading, spacing: 20) {
            MapView(coordinate: service.response?.coordinate ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)).frame(height: 600)
            HStack {
                Text("City: ").font(.system(size: 24, weight: .bold))
                Text(service.city).font(.system(size: 24, weight: .regular))
            }.padding(.leading,10)
            HStack {
                Text("Temperature: ").font(.system(size: 24, weight: .bold))
                Text((service.response?.temprature ?? "") + "°").font(.system(size: 24, weight: .regular))
            }.padding(.leading,10)
            HStack {
                Text("Max Temperature: ").font(.system(size: 24, weight: .bold))
                Text((service.response?.maxTemperature ?? "") + "°").font(.system(size: 24, weight: .regular))
            }.padding(.leading,10)
            HStack {
                Text("Min Temperature: ").font(.system(size: 24, weight: .bold))
                Text((service.response?.minTemperature ?? "") + "°").font(.system(size: 24, weight: .regular))
            }.padding(.leading,10)
        }.edgesIgnoringSafeArea(.top).onAppear { self.service.fetchCurrentWeatherDetails() }

    }
}

