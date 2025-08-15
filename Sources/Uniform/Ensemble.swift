import struct DrumKit.Ensemble

public extension Ensemble {
	static func name(for record: String) -> String? {
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
			"Rocky Mountain Brassworks",
			"Rosemont King Cobras",
			"Sound Wave",
			"Sound of Sun Prairie",
			"Sparta Ignite"
		]
		
		return ensembles.contains(record) ? record : nil
	}
}
