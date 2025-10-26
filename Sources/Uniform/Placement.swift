import struct DrumKit.Placement

public extension Placement {
	static func groupName(for record: String) -> String {
		switch record {
		case "High School 57": "Beijing 57 High School"
		case "Calgary Stetson Show Band": "Calgary Stetson Showband"
		case "Blue Devils \"B\"": "Blue Devils B"
		case "Blue Devils \"C\"": "Blue Devils C"
		case "Hurricanes": "Connecticut Hurricanes"
		default: record
		}
	}
}
