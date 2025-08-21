import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		var record = record
		if record.contains("Presentation -") {
			return record.replacingOccurrences(of: " -", with: ":")
		}

		let features = [
			"Announcement",
			"Anthem",
			"Award",
			"Battle",
			"Ceremony",
			"Championship",
			"Encore",
			"Exhibition Unit",
			"Gates Open",
			"Giveaway",
			"Hall of Fame",
			"Intermission",
			"Kick Start",
			"Opening Remarks",
			"Pre-",
			"Presentation",
			"Retreat",
			"Score",
			"SoundSport",
			"Special",
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
