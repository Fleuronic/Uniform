import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")
			.replacingOccurrences(of: "A Class", with: "Class A")

		name = ["Open", "World", "All-Age", "International"].contains(name) ? name + " Class" : name

		name = switch name {
		case "A", "DCA A": "Class A"
		case "DCA Open", "DCA Open Class", "DCI Open Class": "Open Class"
		case "All-age", "All age corps": "All-Age Class"
		case "Minicorps": "Mini-Corps"
		default: name
		}

		return name
	}
}
