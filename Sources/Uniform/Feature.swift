import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
		let features = [
			"Blue Knights Awards Presentation",
			"Encore",
			"Gates Open",
			"Intermission",
			"Retreat",
			"Scores Announced",
			"Welcome & National Anthem"
		]
		
		return features.first { record.contains($0) }
	}
}
