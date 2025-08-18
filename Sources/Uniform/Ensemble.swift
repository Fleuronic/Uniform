import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let components = record.components(separatedBy: " - ")
		let name = components[0]
		let ensembles = [
			"Alisal Union School District All-Star Academy",
			"Alisal Union School District Marching Band",
			"BANDtastic Honor Band",
			"BKXperience",
			"Bands of America & Carolina Crown",
			"Bram Brata Steel Drums",
			"Columbians Experience",
			"Green Beret Marching Band",
			"Lutheran Vanguard",
			"Minnesota State University Clinic Band",
			"One More Time Around Again Marching Band",
			"PHANtastic",
			"Rocky Mountain Brassworks",
			"Rosemont King Cobras",
			"Sound Wave",
			"Sound of Sun Prairie",
			"Sparta Ignite"
		]

		if ensembles.contains(name)  {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
