//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherDetails {
    public let id: Int
    public let country: String
    public let sunrise: Date
    public let sunset: Date
}

// MARK: - Codable
extension WeatherDetails: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case country
        case sunrise
        case sunset
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        country = try container.decode(String.self, forKey: .country)

        let sunriseUnix = try container.decode(Double.self, forKey: .sunrise)
        let sunsetUnix = try container.decode(Double.self, forKey: .sunset)

        sunrise = Date(timeIntervalSince1970: sunriseUnix)
        sunset = Date(timeIntervalSince1970: sunsetUnix)
    }
}
