import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")

		name = switch name {
		case "Open": "Open Class"
		case "World": "World Class"
		default: name
		}

		return name
	}
}
