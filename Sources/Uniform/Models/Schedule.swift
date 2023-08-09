// Copyright © Fleuronic LLC. All rights reserved.

import struct Diesel.Feature
import struct Diesel.Corps

public struct Schedule: Decodable {
	public let feature: Feature?
	public let corps: Corps?
	public let displayCity: String?
	public let time: String?

	enum CodingKeys: CodingKey {
		case unitName
		case displayCity
		case time
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let unitName = try container.decode(String.self, forKey: .unitName)
		let displayCity = try container.decodeIfPresent(String.self, forKey: .displayCity)
		let normalizedUnitName = .deleted(for: unitName, from: .features) ??
			(displayCity == nil ? unitName.normalized(from: .features) : unitName.normalized(from: .corps))
		self.displayCity = .inserted(for: normalizedUnitName, from: .corps) ?? .inserted(for: unitName, from: .corps) ?? displayCity

		let corpsName = unitName.contains("- ") || unitName.contains(":") ? unitName
			.replacingOccurrences(of: "Encore- ", with: "Encore - ")
			.replacingOccurrences(of: "Encore: ", with: "Encore - ")
			.components(separatedBy: " - ")[1] : self.displayCity.map { _ in normalizedUnitName }

		self.time = try container.decodeIfPresent(String.self, forKey: .time)

		feature = (
			["Encore", "National Anthem"].contains(normalizedUnitName) || self.displayCity == nil
		) ? .init(name: normalizedUnitName) : nil
		corps = corpsName.map { Corps(name: $0.normalized(from: .corps)) }
	}
}
