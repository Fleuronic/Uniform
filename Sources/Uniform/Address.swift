import struct DrumKit.Address

public extension Address {
	static func info(for records: [String]) -> (String, String) {
		switch records {
		case ["Apple Valley, MN"]: return ("6200 140th St W", "55124")
		case ["Apple Valley, MN"]: return ("6200 140th St W", "55124")
		default: break
		}

		let streetAddress = records[0]
			.replacingOccurrences(of: ".", with: "")
			.replacingOccurrences(of: "#", with: "")
			.replacingOccurrences(of: "Drive", with: "Dr")
			.replacingOccurrences(of: "Road", with: "Rd")
			.replacingOccurrences(of: "Street", with: "St")
			.replacingOccurrences(of: "Avenue", with: "Ave")
			.replacingOccurrences(of: "Boulevard", with: "Blvd")
			.replacingOccurrences(of: "Lane", with: "Ln")
			.replacingOccurrences(of: "Highway", with: "Hwy")
			.replacingOccurrences(of: "Route", with: "Rte")
			.replacingOccurrences(of: "One ", with: "1 ")
			.replacingOccurrences(of: "Lawson Rd", with: "9300 Lawson Rd")
			.replacingOccurrences(of: "Oliver Jackson Blvd", with: "2225 Oliver Jackson Blvd")
			.replacingOccurrences(of: "Millenium", with: "Millennium")
			.replacingOccurrences(of: "Rinehardt", with: "Reinhardt")
			.replacingOccurrences(of: "Stanhope Elmore High School", with: "4300 Main Street")
			.replacingOccurrences(of: "SW Haverhill Rd", with: "400 S Haverhill Rd")
			.components(separatedBy: " (").first!
		let zipCode = records[1].components(separatedBy: " ").last!
		return (streetAddress, zipCode)
	}
}
