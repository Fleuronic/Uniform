import struct DrumKit.Circuit

public extension Circuit {
	static func abbreviation(for record: String) -> String {
		let abbreviation = record
			.components(separatedBy: "/").first!
			.replacingOccurrences(of: "'", with: "’")
			.replacingOccurrences(of: "&amp;", with: "&")

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
		case "ADCQ": "Les amis du drum corps québécois"
		case "AL": "American Legion"
		case "BYBA": "British Youth Band Association"
		case "DCI": "Drum Corps International"
		case "DCA": "Drum Corps Associates"
		case "CAMQ": "Circuit des associations musicales du Québec"
		case "EMass": "Eastern Massachusetts"
		case "FAMQ": "Fédération des Associations Musicales du Québec"
		case "GSC": "Garden State Circuit"
		case "DCM": "Drum Corps Midwest"
		case "DCH": "Drum Corps Holland"
		case "DCJ": "Drum Corps Japan"
		case "DMG": "Dutch Music Games"
		case "MCA": "Mini Corps Associates"
		case "ODCA": "Ontario Drum Corps Association"
		case "VFW": "Veterans of Foreign Wars"
		default: abbreviation
		}
	}

	static func isValid(with record: String?)  -> Bool {
		guard let record else { return true }

		return switch record {
		case "Clinic": false
		default: true
		}
	}
}
