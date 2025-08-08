import struct DrumKit.Address

public extension Address {
	static func info(for records: [String]) -> (String, String) {
		let streetAddress = records[0]
			.replacingOccurrences(of: ".", with: "")
			.replacingOccurrences(of: "Road", with: "Rd")
			.replacingOccurrences(of: "Street", with: "St")
			.replacingOccurrences(of: "Avenue", with: "Ave")
			.replacingOccurrences(of: "Boulevard", with: "Blvd")
			.replacingOccurrences(of: "Lane", with: "Ln")
			.replacingOccurrences(of: "Highway", with: "Hwy")
			.replacingOccurrences(of: "Route", with: "Rte")
		let zipCode = records[1].components(separatedBy: " ").last!
		return (streetAddress, zipCode)
	}
}
