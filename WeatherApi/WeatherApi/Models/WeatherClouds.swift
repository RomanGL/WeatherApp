//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherClouds {
    public let cloudiness: Int
}

// MARK: - Codable
extension WeatherClouds: Codable {

    enum CodingKeys: String, CodingKey {
        case cloudiness = "all"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        cloudiness = try container.decode(Int.self, forKey: .cloudiness)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(cloudiness, forKey: .cloudiness)
    }
}
