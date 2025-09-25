import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		record
			.replacingOccurrences(of: "All Age", with: "All-Age")
	}
}
