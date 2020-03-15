//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherMain {
    public let temperature: Double
    public let feelsLike: Double
    public let minTemperature: Double
    public let maxTemperature: Double
    public let pressure: Int
    public let humidity: Int
}

// MARK: - Codable
extension WeatherMain: Codable {

    enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case feelsLike = "feels_like"
        case minTemperature = "temp_min"
        case maxTemperature = "temp_max"
        case pressure = "pressure"
        case humidity = "humidity"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        temperature = try container.decode(Double.self, forKey: .temperature)
        feelsLike = try container.decode(Double.self, forKey: .feelsLike)
        minTemperature = try container.decode(Double.self, forKey: .minTemperature)
        maxTemperature = try container.decode(Double.self, forKey: .maxTemperature)
        pressure = try container.decode(Int.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(temperature, forKey: .temperature)
        try container.encode(feelsLike, forKey: .feelsLike)
        try container.encode(minTemperature, forKey: .minTemperature)
        try container.encode(maxTemperature, forKey: .maxTemperature)
        try container.encode(pressure, forKey: .pressure)
        try container.encode(humidity, forKey: .humidity)
    }
}
