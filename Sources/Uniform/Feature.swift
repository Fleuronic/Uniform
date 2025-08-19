import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		let features = [
			"Award",
			"Encore",
			"Gates Open",
			"Intermission",
			"Opening Remarks",
			"Retreat",
			"Scores Announced",
			"Welcome"
		]
		
		return features.contains(record.contains) ? record : nil
	}
}
