//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherInfo {
    public let id: Int
    public let name: String
    public let timeZone: TimeZone?
    public let visibility: Int
    public let calculationTime: Date
    public let base: String

    public let coordinate: WeatherCoordinate
    public let weather: WeatherShortInfo
    public let main: WeatherMain
    public let wind: WeatherWind
    public let details: WeatherDetails
    public let cloudiness: Int
}

// MARK: - Codable
extension WeatherInfo: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case timeZone = "timezone"
        case visibility
        case calculationTime = "dt"
        case base
        case coordinate = "coord"
        case weather
        case main
        case wind
        case details = "sys"
        case cloudiness = "clouds"
    }

    enum CloudinessCodingKeys: String, CodingKey {
        case all
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        visibility = try container.decode(Int.self, forKey: .visibility)
        base = try container.decode(String.self, forKey: .base)
        coordinate = try container.decode(WeatherCoordinate.self, forKey: .coordinate)
        weather = try container.decode(WeatherShortInfo.self, forKey: .weather)
        main = try container.decode(WeatherMain.self, forKey: .main)
        wind = try container.decode(WeatherWind.self, forKey: .wind)
        details = try container.decode(WeatherDetails.self, forKey: .details)

        let timeZoneSeconds = try container.decode(Int.self, forKey: .timeZone)
        let calculationTimeUnix = try container.decode(Double.self, forKey: .calculationTime)

        timeZone = TimeZone(secondsFromGMT: timeZoneSeconds)
        calculationTime = Date(timeIntervalSince1970: calculationTimeUnix)

        let cloudinessContainer = try container.nestedContainer(keyedBy: CloudinessCodingKeys.self,
                                                                forKey: .cloudiness)
        cloudiness = try cloudinessContainer.decode(Int.self, forKey: .all)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(visibility, forKey: .visibility)
        try container.encode(base, forKey: .base)
        try container.encode(coordinate, forKey: .coordinate)
        try container.encode(weather, forKey: .weather)
        try container.encode(main, forKey: .main)
        try container.encode(wind, forKey: .wind)
        try container.encode(details, forKey: .details)

        let timeZoneSeconds = timeZone?.secondsFromGMT() ?? 0
        let calculationUnixTime = calculationTime.timeIntervalSince1970

        try container.encode(timeZoneSeconds, forKey: .timeZone)
        try container.encode(UInt64(calculationUnixTime), forKey: .calculationTime)

        var cloudinessContainer = container.nestedContainer(keyedBy: CloudinessCodingKeys.self,
                                                            forKey: .cloudiness)
        try cloudinessContainer.encode(cloudiness, forKey: .all)
    }
}
