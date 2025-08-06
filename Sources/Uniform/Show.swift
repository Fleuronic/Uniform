import struct DrumKit.Show

public extension Show {
	static func name(for record: String) -> String {
		let name = record
			.replacingOccurrences(of: " - ", with: " — ")
			.replacingOccurrences(of: "--", with: "—")
			.replacingOccurrences(of: "?", with: "—")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
			.replacingOccurrences(of: "SUMMER MUSIC GAMES;", with: "Summer Music Games")

		return name
			.components(separatedBy: " @ ").first!
			.components(separatedBy: " presented by ").first!
	}

	static func isValid(with record: String?)  -> Bool {
		guard let record else { return true }
		
		return !record.contains("SoundSport") &&
			!record.contains("Battle") &&
			!record.contains("Virtual") &&
			!record.contains("Rain") &&
			!record.contains("Mini Corps")
	}
}
