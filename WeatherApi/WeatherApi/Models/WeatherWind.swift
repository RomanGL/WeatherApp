//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherWind {
    public let speed: Int
    public let degrees: Int
}

// MARK: - Codable
extension WeatherWind: Codable {

    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case degrees = "deg"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        speed = try container.decode(Int.self, forKey: .speed)
        degrees = try container.decode(Int.self, forKey: .degrees)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(speed, forKey: .speed)
        try container.encode(degrees, forKey: .degrees)
    }
}
