// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import struct DrumKit.Corps

@MemberwiseInit(.public)
public struct Corps: Equatable, Sendable {
	public let name: String
}

// MARK: -
public extension DrumKit.Corps {
	typealias Info = (String, String)

	static func info(for record: String) -> Info? {
		guard 
			case let components = record.components(separatedBy: " - "),
			components.count == 2 else { return nil }
		
		var name = components[0]
			.replacingOccurrences(of: "The ", with: "")
		let location = components[1]

		name = switch name {
		case "Conquest Drum & Bugle Corps": "Conquest"
		case "Hurricanes": "Connecticut Hurricanes"
		default: name
		}

		return (name, location)
	}
}
