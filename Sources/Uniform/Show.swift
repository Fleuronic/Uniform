import struct DrumKit.Show

public extension Show {
	static func name(for record: String) -> String {
		record
			.replacingOccurrences(of: "--", with: "—")
			.replacingOccurrences(of: "-", with: "—")
			.replacingOccurrences(of: "?", with: "—")
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")
	}
}
