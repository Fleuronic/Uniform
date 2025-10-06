import struct DrumKit.Division

public extension Division {
	static func name(for record: String) -> String {
		var name = record
			.replacingOccurrences(of: "All Age", with: "All-Age")

		name = ["Open", "World", "All-Age"].contains(name) : name + " Class" ? : name

		return name
	}
}
