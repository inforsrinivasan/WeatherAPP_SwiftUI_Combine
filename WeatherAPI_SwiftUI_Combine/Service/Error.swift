//
//  Error.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case DecodingError
    case URLError
    case NetworkError
}
