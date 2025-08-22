import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		if ["Presentation -", " - Special", "Videoboard Feature"].contains(where: record.contains) {
			return record
				.replacingOccurrences(of: " -", with: ":")
				.replacingOccurrences(of: "Univ.", with: "University")
		} 

		var record = record
			.replacingOccurrences(of: "  ", with: " ")
			.replacingOccurrences(of: "Age Out", with: "Age-Out")
			.replacingOccurrences(of: "Drum Line Battle", with: "DrumLine Battle")
			.replacingOccurrences(of: "Drumline Jam", with: "DrumLine Jam")
			.replacingOccurrences(of: "FJM Endzone -", with: "FJM Endzone Performance -")
			.replacingOccurrences(of: "Music Stage -", with: "Music Stage Performance -")
			.replacingOccurrences(of: "Givaway", with: "Giveaway")
			.replacingOccurrences(of: "On Field", with: "On-Field")

		let features = [
			"Announcement",
			"Anthem",
			"Award",
			"Ceremony",
			"Championship",
			"Doors Open",
			"DrumLine",
			"Encore",
			"Endzone",
			"Exhibition Unit",
			"Gates Open",
			"Giveaway",
			"Halftime",
			"Hall of Fame",
			"Intermission",
			"Kick Start",
			"Music Stage",
			"Opening Remarks",
			"Pre-",
			"Presentation",
			"Quintet",
			"Recognition",
			"Retreat",
			"Score",
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
