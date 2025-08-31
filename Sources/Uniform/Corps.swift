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
		if record.contains("Marine D") {
			return ("U.S. Marine Drum & Bugle Corps", "Washington, D.C.")
		}

		switch record {
		case "Blue Knights": return (record, "Denver, CO")
		case "Blue Stars": return (record, "La Crosse, WI")
		case "Bluecoats Alumni Corps": return (record, "Canton, OH")
		case "Colts Alumni Corps": return (record, "Dubuque, IA")
		case "Crossmen Alumni Corps": return (record, "San Antonio, TX")
		case "Gold": return (record, "San Diego, CA")
		case "Madison Scouts": return (record, "Madison, WI")
		case "Music City": return (record, "Nashville, TN")
		case "Pacific Crest": return (record, "Diamond Bar, CA")
		case "Phantom Regiment": return (record, "Rockford, IL")
		case "Sonus Brass Theater": return (record, "Woodbridge, VA")
		case "Spirit of Atlanta": return (record, "Atlanta, GA")
		case "The Academy": return (record, "Tempe, AZ")
		case "The Cadets": return (record, "Erie, PA")
		case "The Thunder of Roanoke": return (record, "Roanoke, VA")
		case "Troopers": return (record, "Casper, WY")
		default: break
		}

		guard 
			case let components = record.components(separatedBy: " - "),
			components.count == 2 else { return nil }
		
		var name = components[0]
			.replacingOccurrences(of: "Blue Stars 60th Anniv. Corps", with: "Blue Stars 60th Alumni Corps")
			.replacingOccurrences(of: "Impact of Orlando", with: "IMPACT")
			.replacingOccurrences(of: "Inbhear Mor", with: "Inbhear Mór")
			.replacingOccurrences(of: "New York Skyliners", with: "Skyliners")
			.replacingOccurrences(of: "Phantom Regiment Alumni Association", with: "Phantom Regiment Alumni Corps")
			.replacingOccurrences(of: "Sacramento Freelancers Alumni", with: "Freelancers Alumni")
			.replacingOccurrences(of: "The Colts", with: "Colts")
			.replacingOccurrences(of: "The Muchachos", with: "Muchachos")
			.replacingOccurrences(of: " Drum & Bugle Corps", with: "")
			.replacingOccurrences(of: " Drum and Bugle Corps", with: "")
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
