import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	private static let nameReplacements = Resource.pairs("ensemble-name-replacements")
	private static let names = Resource.map("ensemble-names")
	private static let bands = Set(Resource.list("ensemble-bands"))
	private static let locations = Resource.map("ensemble-locations")
	private static let keywords = Resource.list("ensemble-keywords")
	private static let excludes = Resource.list("ensemble-excludes")
	private static let infoMap = Resource.tuples("ensemble-info")
	private static let ownLocations = Set(Resource.list("ensemble-own-locations"))
	private static let nilLocations = Set(Resource.list("ensemble-nil-locations"))

	static func info(for record: String) -> Info? {
		let allComponents = record.components(separatedBy: " - ")
		let components = [allComponents.first!, allComponents.last!]

		let base = nameReplacements
			.reduce(components[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.trimmingCharacters(in: .whitespaces)
		let name = names[base] ?? base

		// IMBA (Irish) & allied UK marching bands are scored as bands, not drum
		// corps. Guard on the record's country so same-named US corps (e.g. the
		// Ravens and Vikings drum corps) keep their corps classification.
		if
			bands.contains(name),
			let location = components.count > 1 ? components[1] : nil,
			location.contains("Ireland") || location.contains("United Kingdom") {
			return (name, location)
		}

		if let info = infoMap[name] {
			return info
		}

		if ownLocations.contains(name) {
			return (name, components[1])
		}

		if nilLocations.contains(name) {
			return (name, nil)
		}

		if let location = locations[name] {
			return (name, location)
		}

		if
			keywords.contains(where: name.contains) &&
			!excludes.contains(where: name.contains) {
			let location = components.count > 1 ? components[1] : nil
			return (name, location)
		} else {
			return nil
		}
	}
}
