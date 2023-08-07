// Copyright © Fleuronic LLC. All rights reserved.

import struct Diesel.Feature
import struct Diesel.Corps

public struct Schedule: Decodable {
	public let unitName: String
	public let displayCity: String?
	public let time: String?

	enum CodingKeys: CodingKey {
		case unitName
		case displayCity
		case time
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		unitName = try container.decode(String.self, forKey: .unitName)

		let displayCity = try container.decodeIfPresent(String.self, forKey: .displayCity)
		self.displayCity = unitName == "Bushwackers" ? "Princeton, NJ" : displayCity
		self.time = try container.decodeIfPresent(String.self, forKey: .time)
	}
}

// MARK: -
public extension Schedule {
	var feature: Feature? {
		if unitName.contains("Encore") {
			return .init(name: "Encore")
		} else if displayCity == nil {
			return .init(name: unitName)
		} else {
			return nil
		}
	}

	var corps: Corps? {
		if feature == nil {
			return .init(name: unitName.replacingOccurrences(of: "\"", with: ""))
		} else if unitName.contains("Encore") {
			var components = unitName.components(separatedBy: " - ")
			if components.count < 2 {
				components = unitName.components(separatedBy: "- ")
			}

			return components.count == 2 ? .init(name: components[1]) : nil
		} else {
			return nil
		}
	}
}
