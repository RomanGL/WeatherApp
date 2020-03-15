//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

public struct WeatherShortInfo {
    public let id: Int
    public let main: String
    public let description: String
    public let icon: String
}

// MARK: - Codable
extension WeatherShortInfo: Codable {

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(Int.self, forKey: .id)
        main = try container.decode(String.self, forKey: .main)
        description = try container.decode(String.self, forKey: .description)
        icon = try container.decode(String.self, forKey: .icon)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(main, forKey: .main)
        try container.encode(description, forKey: .description)
        try container.encode(icon, forKey: .icon)
    }
}
