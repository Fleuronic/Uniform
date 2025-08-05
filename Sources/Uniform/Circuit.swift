import struct DrumKit.Circuit

public extension Circuit {
	static func name(for abbreviation: String) -> String {
		switch abbreviation {
		case "DCI": "Drum Corps International"
		case "DCA": "Drum Corps Associates"
		case "DCM": "Drum Corps Midwest"
		case "DCH": "Drum Corps Holland"
		case "DCJ": "Drum Corps Japan"
		case "DMG": "Dutch Music Games"
		case "AL": "American Legion"
		case "VFW": "Veterans of Foreign Wars"
		case "CAMQ": "Circuit des associations musicales du Québec"
		case "FAMQ": "Fédération des Associations Musicales du Québec"
		default: abbreviation
		}
	}
}
