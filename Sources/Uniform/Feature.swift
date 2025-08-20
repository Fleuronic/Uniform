import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		let features = [
			"Anthem",
			"Award",
			"Ceremony",
			"Championship",
			"Encore",
			"Gates Open",
			"Giveaway",
			"Intermission",
			"Opening Remarks",
			"Retreat",
			"Score",
			"Welcome"
		]
		
		return if features.contains(where: record.contains) {
			record
				.components(separatedBy: " - ")
				.first!
				.replacingOccurrences(of: "Encore- ", with: "Encore - ")
				.replacingOccurrences(of: "Encore: ", with: "Encore - ")
				.replacingOccurrences(of: " and ", with: " & ")
				.replacingOccurrences(of: "Award ", with: "Awards")
				.replacingOccurrences(of: "AwardsCeremony", with: "Awards Ceremony")
		} else { nil }
	}
}
