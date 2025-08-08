import struct DrumKit.Address

public extension Address {
	static func info(for records: [String]) -> (String, String) {
		let streetAddress = records[0]
		let zipCode = records[1]
		return (streetAddress, zipCode)
	}
}
