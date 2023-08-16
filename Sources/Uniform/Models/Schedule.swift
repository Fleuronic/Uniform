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
		let timeString = try container.decodeIfPresent(String.self, forKey: .time)
		self.displayCity = .inserted(for: normalizedUnitName, from: .corps) ?? .inserted(for: unitName, from: .corps) ?? displayCity

		let corpsName = unitName.contains("- ") || unitName.contains(":") ? unitName
			.replacingOccurrences(of: "Encore- ", with: "Encore - ")
			.replacingOccurrences(of: "Encore: ", with: "Encore - ")
			.replacingOccurrences(of: "Pre-show Entertainment: ", with: "Pre-show Entertainment - ")
			.replacingOccurrences(of: "Exhibition: ", with: "Exhibition - ")
			.replacingOccurrences(of: "  ", with: " ")
			.components(separatedBy: " - ")[1] :
			displayCity.flatMap { .inserted(for: $0, from: .locations) } ??
			self.displayCity.map { _ in normalizedUnitName }

		feature = (
			[
				"Encore",
				"National Anthem",
				"On Field Encore",
				"Open Class Champion Encore",
				"Pre-show Entertainment",
				"Welcome & National Anthem"
			].contains(normalizedUnitName) ||
			self.displayCity == nil
		) ? .init(name: normalizedUnitName) : nil

		corps = corpsName.map { Corps(name: $0.replacingOccurrences(of: "\"", with: "").normalized(from: .corps)) }
		time = timeString.map {
			let components: [String]
			if $0.contains(" - ") {
				components = $0.components(separatedBy: " - ")
			} else if $0.contains(".  ") {
				components = $0.components(separatedBy: ".  ")
			} else if $0.contains(") ") {
				components = $0.components(separatedBy: ") ")
			} else {
				components = []
			}

			if components.isEmpty {
				return $0.contains("M") ? $0 : "\($0) PM"
			} else {
				let index = Int(components[0])!
				let time = components[1]
				let amPM = index <= 2 ? "AM" : "PM"
				return time.contains(" ") ? time : "\(time) \(amPM)"
			}
		}

		if feature?.name == "U.S. Marine Drum & Bugle Corps" {
			print("Hi")
		}
	}
}
