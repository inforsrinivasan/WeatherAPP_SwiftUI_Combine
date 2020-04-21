//
//  Parsing.swift
//  WeatherAPI_SwiftUI_Combine
//
//  Created by Srinivasan Rajendran on 2020-04-20.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, WeatherError> {
    let jsonDecoder = JSONDecoder()
    jsonDecoder.dateDecodingStrategy = .secondsSince1970
    return Just(data)
        .decode(type: T.self, decoder: jsonDecoder)
        .mapError { _ in WeatherError.DecodingError }
        .eraseToAnyPublisher()
}
