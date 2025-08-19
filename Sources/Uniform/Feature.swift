import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		let features = [
			"Award",
			"Ceremony",
			"Championship",
			"Encore",
			"Gates Open",
			"Intermission",
			"Opening Remarks",
			"Retreat",
			"Score",
			"Welcome"
		]
		
		return features.contains(where: record.contains) ? record : nil
	}
}
