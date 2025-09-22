import struct DrumKit.Placement

public extension Placement {
	static func groupName(for record: String) -> String {
		switch record {
		case "High School 57": "Beijing 57 High School"
		case "Calgary Stetson Show Band": "Calgary Stetson Showband"
		default: record
		}
	}
}
