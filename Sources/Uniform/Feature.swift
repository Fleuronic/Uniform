import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		if record.contains("Presentation -") {
			return record.replacingOccurrences(of: " -", with: ":")
		}

		var record = record
			.replacingOccurrences(of: "Givaway", with: "Giveaway")

		let features = [
			"Announcement",
			"Anthem",
			"Award",
			"Battle",
			"Ceremony",
			"Championship",
			"Doors Open",
			"Drumline Jam",
			"Encore",
			"Exhibition Unit",
			"Gates Open",
			"Giveaway",
			"Halftime",
			"Hall of Fame",
			"Intermission",
			"Kick Start",
			"Opening Remarks",
			"Pre-",
			"Presentation",
			"Quintet",
			"Recognition",
			"Retreat",
			"Score",
			"SoundSport",
			"Special",
			"Stadium Closed to Spectators",
			"Standstill",
			"Ultimate Drill Book",
			"University",
			"Video",
			"Welcome"
		]

		record = switch record {
		case "SoundSport": "SoundSport Exhibition"
		default: record
		}
		
		return if features.contains(where: record.contains) {
			record
				.replacingOccurrences(of: " and ", with: " & ")
				.replacingOccurrences(of: "Award ", with: "Awards")
				.replacingOccurrences(of: "AwardsCeremony", with: "Awards Ceremony")
				.replacingOccurrences(of: "Encore- ", with: "Encore - ")
				.replacingOccurrences(of: "Encore: ", with: "Encore - ")
				.replacingOccurrences(of: "Entertainment: ", with: "Entertainment - ")
				.replacingOccurrences(of: "Pre-show", with: "Pre-Show")
				.components(separatedBy: " - ")
				.first { features.contains(where: $0.contains) }!
		} else { nil }
	}
}
