import struct DrumKit.Venue

public extension Venue {
	static func info(for record: String) -> (String, String?) {
		("\(record) Stadium", record)
	}
}
