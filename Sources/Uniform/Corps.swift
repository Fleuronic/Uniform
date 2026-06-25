// Copyright © Fleuronic LLC. All rights reserved.

import MemberwiseInit
import struct DrumKit.Corps

@MemberwiseInit(.public)
public struct Corps: Equatable, Sendable {
	public let name: String
	public let city: String
	public let state: String
	public let country: String
}

// MARK: -
public extension DrumKit.Corps {
	typealias Info = (String, String)

	static func info(for record: String) -> Info? {
		if record.contains("Marine D") || record.contains("Marine Corps") || record == "US Marines" {
			return ("U.S. Marine Drum & Bugle Corps", "Washington, D.C.")
		}

		switch record {
		case "Apogee", "Latrobe Music Center": return ("APOGEE", "Latrobe, PA")
		case "Blue Knights": return (record, "Denver, CO")
		case "Blue Stars": return (record, "La Crosse, WI")
		case "Bluecoats Alumni Corps": return (record, "Canton, OH")
		case "Colts Alumni Corps": return (record, "Dubuque, IA")
		case "Crossmen Alumni Corps": return (record, "San Antonio, TX")
		case "Gold": return (record, "San Diego, CA")
		case "Legacy Drum & Bugle Corps - Rutherford": return ("Legacy", "Rutherford, NJ")
		case "LSM Drum Corps": return (record, "Woodhaven, MI")
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
		case "CT Alumni": return (record, "Seymour, CT")
		default: break
		}

		guard
			case let components = record.components(separatedBy: " - "),
			components.count == 2 else { return nil }

		var name = components[0]
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: " *", with: "")
			.replacingOccurrences(of: "New York Skyliners", with: "Skyliners")
			.replacingOccurrences(of: " Drum & Bugle Corps", with: "")
			.replacingOccurrences(of: " Drum and Bugle Corps", with: "")
			.replacingOccurrences(of: "Minicorps", with: "Mini-Corps")
			.replacingOccurrences(of: "de Quebec", with: "du Québec")
			.replacingOccurrences(of: " (UK)", with: "")
			.replacingOccurrences(of: " (Ire)", with: "")
		let location = components[1]

		name = switch name {
		case "Blue Devils \"B\"": "Blue Devils B"
		case "Blue Devils \"C\"": "Blue Devils C"
		case "Hurricanes": "Connecticut Hurricanes"
		case "Thunder": "Spokane Thunder"
		case "Blue Stars 60th Anniv. Corps": "Blue Stars 60th Alumni Corps"
		case "Impact of Orlando": "IMPACT"
		case "Inbhear Mor": "Inbhear Mór"
		case "Phoenix (Fl)": "Phoenix"
		case "Phantom Regiment Alumni Association": "Phantom Regiment Alumni Corps"
		case "Sacramento Freelancers Alumni", "Sacramento Freelancers Alumni Corps", "Sacramento Freelancers Mini-Corps", "Freelancers Mini-Corps", "Freelancers Alumni Corps": "Freelancers Alumni"
		case "Ghost Riders Mini-Corps": "Ghost Riders"
		case "Star United Mini-Corps": "Star United"
		case "Sine Wave Mini Corps": "Sine Wave"
		case "Valley Thunder Mini-Corps": "Valley Thunder"
		case "Minne Brass Mini-Corps": "Minne-Brass"
		case "MBI": "Minnesota Brass"
		case "Beeches Ensemble": "Beeches"
		case "Reading Buccaneers Alumni Corps": "Buccaneers Alumni"
		case "Mag Brass": "Magnificent Brass"
		case "Caballeros Alumni": "Hawthorne Caballeros Alumni"
		case "The Colts": "Colts"
		case "The Muchachos": "Muchachos"
		case "Kilties Senior Corps": "Kilties"
		case "Warriors": "Warriors Alumni"
		case "The Bluecoats": "Bluecoats"
		case "The Connexion", "The ConneXion": "Connexion"
		default: name
		}

		return (name, location)
	}
}
