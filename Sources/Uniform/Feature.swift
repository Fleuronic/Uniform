import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		if record.contains("Presentation -") {
			return record.replacingOccurrences(of: " -", with: ":")
		}

		let features = [
			"Anthem",
			"Award",
			"Battle",
			"Ceremony",
			"Championship",
			"Encore",
			"Gates Open",
			"Giveaway",
			"Intermission",
			"Opening Remarks",
			"Pre-show",
			"Retreat",
			"Score",
			"Special",
			"Ultimate Drill Book",
			"Video",
			"Welcome"
		]
		
		return if features.contains(where: record.contains) {
			record
				.replacingOccurrences(of: "Encore- ", with: "Encore - ")
				.replacingOccurrences(of: "Encore: ", with: "Encore - ")
				.replacingOccurrences(of: "Entertainment: ", with: "Entertainment - ")
				.replacingOccurrences(of: " and ", with: " & ")
				.replacingOccurrences(of: "Award ", with: "Awards")
				.replacingOccurrences(of: "AwardsCeremony", with: "Awards Ceremony")
				.components(separatedBy: " - ")
				.first!
		} else { nil }
	}
}
