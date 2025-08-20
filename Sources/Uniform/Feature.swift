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
				.replacingOccurrences(of: "Award ", with: "Awards")
		} else { nil }
	}
}
