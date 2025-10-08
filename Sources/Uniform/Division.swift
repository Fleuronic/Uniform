import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")
			.replacingOccurrences(of: "A Class", with: "Class A")

		name = ["Open", "World", "All-Age"].contains(name) ? name + " Class" : name

		name = switch name {
		case "A": "Class A"
		case "Minicorps": "Mini-Corps"
		default: name
		}

		return name
	}
}
