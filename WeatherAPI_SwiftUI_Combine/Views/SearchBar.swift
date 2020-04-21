//
//  SearchBar.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import SwiftUI

struct SearchBar: View {

    @ObservedObject var viewModel: WeeklyWeatherViewModel

    var body: some View {
        ZStack {
            Color.purple
            HStack {
                TextField("Enter City", text: $viewModel.city).frame(height: 40)
                    .background(Color.white).opacity(0.8).cornerRadius(20)
                Button(action: {

                }) { Text("Search") }.foregroundColor(.white).font(.system(size: 20, weight: .regular))
                }.padding([.leading,.trailing], 20)
        }
    }
}
