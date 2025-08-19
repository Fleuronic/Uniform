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
		if record.contains("Marine") {
			return ("U.S. Marine Drum & Bugle Corps", "Washington, D.C.")
		}

		guard 
			case let components = record.components(separatedBy: " - "),
			components.count == 2 else { return nil }
		
		var name = components[0]
			.replacingOccurrences(of: "The ", with: "")
			.replacingOccurrences(of: " Drum & Bugle Corps", with: "")
		let location = components[1]

		name = switch name {
		case "Blue Devils \"B\"": "Blue Devils B"
		case "Blue Devils \"C\"": "Blue Devils C"
		case "Hurricanes": "Connecticut Hurricanes"
		default: name
		}

		return (name, location)
	}
}
