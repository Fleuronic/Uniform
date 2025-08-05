import struct DrumKit.Show

public extension Show {
	static func name(for record: String) -> String {
		let name = record
			.replacingOccurrences(of: " - ", with: " — ")
			.replacingOccurrences(of: "--", with: "—")
			.replacingOccurrences(of: "?", with: "—")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
		return name.components(separatedBy: " presented by ").first!
	}

	static func isValid(with record: String)  -> Bool {
		!record.contains("SoundSport") &&
			!record.contains("Battle") &&
			!record.contains("Virtual") &&
			!record.contains("Rain") &&
			!record.contains("Mini Corps")
	}
}
