// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Corps

@testable import Uniform

struct CorpsTests {
	@Test func matchesLegacy() {
		let inputs = [
			"Marine Drum & Bugle", "US Marines", "Some Marine Corps thing",
			"Apogee", "Latrobe Music Center", "Blue Knights", "Gold",
			"Legacy Drum & Bugle Corps - Rutherford",
			"The Cadets", "Troopers", "CT Alumni",
			"New York Skyliners - New York, NY",
			"Some Corps Drum & Bugle Corps - Town, ST",
			"Minicorps - City, ST",
			"Corps de Quebec - Quebec, QC",
			"Corps (UK) - London, UK",
			"Hurricanes - Connecticut, CT",
			"MBI - Rockford, IL",
			"The Bluecoats - Canton, OH",
			"Chevaliers - Quebec, QC",
			"Les Etoiles - Quebec, QC",
			"Senateurs - L'Ancienne-Lorette, QC",
			"Random Corps - City, ST",
			"NoLocationRecord",
			"Too - Many - Dashes - Here"
		]

		for input in inputs {
			#expect(Self.eq(Corps.info(for: input), Self.legacyInfo(for: input)), "mismatch for \(input)")
		}
	}

	private static func eq(_ a: (String, String)?, _ b: (String, String)?) -> Bool {
		switch (a, b) {
		case (nil, nil): return true
		case let (x?, y?): return x.0 == y.0 && x.1 == y.1
		default: return false
		}
	}

	private static func legacyInfo(for record: String) -> (String, String)? {
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

		let nameReplacements = [
			("'", "’"),
			("\"", ""),
			(" *", ""),
			("New York Skyliners", "Skyliners"),
			(" Drum & Bugle Corps", ""),
			(" Drum and Bugle Corps", ""),
			(" D&B Corps", ""),
			("Minicorps", "Mini-Corps"),
			("de Quebec", "du Québec"),
			(" (UK)", ""),
			(" (Ire)", "")
		]
		var name = nameReplacements.reduce(components[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
		let location = components[1]

		name = switch name {
		case "Hurricanes": "Connecticut Hurricanes"
		case "Thunder": "Spokane Thunder"
		case "Blue Stars 60th Anniv. Corps": "Blue Stars 60th Alumni Corps"
		case "Impact of Orlando": "IMPACT"
		case "Hamilton Youth Performing Ensemble": "H.Y.P.E."
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
		case "Show en Drumfanfare Vaartbroek": "Drumfanfare Vaartbroek"
		case "3e Regiment": "3ᵉ Régiment"
		case "Arcs-en-Ciel": "Les Arcs-en-Ciel"
		case "Chevaliers": "Les Chevaliers"
		case "Etoiles", "Les Etoiles": "Les Étoiles"
		case "Melomanes": "Les Mélomanes"
		case "Pers-Clairs": "Les Pers-Clairs"
		case "Quebec Alliance": "Québec Alliance"
		case "Releve Musicale": "La Relève Musicale"
		case "Les Senateurs": "Les Sénateurs"
		case "Senateurs": "Les Sénateurs (L’Ancienne-Lorette)"
		default: name
		}

		return (name, location)
	}
}
