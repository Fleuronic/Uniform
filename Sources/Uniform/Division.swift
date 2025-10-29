import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")
			.replacingOccurrences(of: "A Class", with: "Class A")

		name = ["Open", "World", "All-Age"].contains(name) ? name + " Class" : name

		name = switch name {
		case "A", "DCA A": "Class A"
		case "DCA Open", "DCI Open": "Open Class"
		case "Minicorps": "Mini-Corps"
		default: name
		}

		return name
	}

	static func circuitAbbreviation(forDivisionNamed record: String) -> String? {
		switch record {
		case "DCI Open": "DCI"
		case "DCA Open", "DCA A": "DCA"
		}
	}
}
