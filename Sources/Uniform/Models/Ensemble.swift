import struct DrumKit.Ensemble

public extension Ensemble {
	typealias Info = (String, String?)

	static func info(for record: String) -> Info? {
		let allComponents = record.components(separatedBy: " - ")
		let components = [allComponents.first!, allComponents.last!]

		let base = nameReplacements
			.reduce(components[0]) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.trimmingCharacters(in: .whitespaces)
		let name = names[base] ?? base

		if
			bands.contains(name),
			bandCountries.contains(where: components[1].contains) {
			return (name, components[1])
		}

		if let info = infoMap[name] { return info }
		if ownLocations.contains(name) { return (name, components[1]) }
		if nilLocations.contains(name) { return (name, nil) }
		if let location = locations[name] { return (name, location) }

		if
			keywords.contains(where: name.contains) &&
			!excludes.contains(where: name.contains) {
			return (name, components[1])
		} else {
			return nil
		}
	}
}

// MARK: -
private extension Ensemble {
	static let nameReplacements = Resource.pairs(from: "ensemble-name-replacements")
	static let names = Resource.map(from: "ensemble-names")
	static let bands = Set(Resource.list(from: "ensemble-bands"))
	static let bandCountries = Resource.list(from: "ensemble-band-countries")
	static let locations = Resource.map(from: "ensemble-locations")
	static let keywords = Resource.list(from: "ensemble-keywords")
	static let excludes = Resource.list(from: "ensemble-excludes")
	static let infoMap = Resource.tuples(from: "ensemble-info")
	static let ownLocations = Set(Resource.list(from: "ensemble-own-locations"))
	static let nilLocations = Set(Resource.list(from: "ensemble-nil-locations"))
}
