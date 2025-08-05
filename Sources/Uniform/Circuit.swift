import struct DrumKit.Circuit

public extension Circuit {
	static func abbreviation(for record: String) -> String {
		let abbreviation = record.components(separatedBy: "/").first!
	
		return switch abbreviation {
		case "", "DCI Division II & III": "DCI"
		case "American Legion": "AL"
		case "DCA-C", "DCA-Central": "DCA Central"
		case "DCG": "DMG"
		case "DCA-S", "DCI-South": "DCI South"
		case "DCI-Pacific": "DCI Pacific"
		default: abbreviation
		}
	}

	static func name(for abbreviation: String) -> String {
		switch abbreviation {
		case "AL": "American Legion"
		case "DCI": "Drum Corps International"
		case "DCA": "Drum Corps Associates"
		case "CAMQ": "Circuit des associations musicales du Québec"
		case "FAMQ": "Fédération des Associations Musicales du Québec"
		case "DCM": "Drum Corps Midwest"
		case "DCH": "Drum Corps Holland"
		case "DCJ": "Drum Corps Japan"
		case "DMG": "Dutch Music Games"
		case "MCA": "Mini Corps Associates"
		case "VFW": "Veterans of Foreign Wars"
		default: abbreviation
		}
	}
}
