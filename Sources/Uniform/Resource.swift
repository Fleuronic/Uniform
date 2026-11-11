// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

enum Resource {
	static func map(from name: String) -> [String: String] {
		if let grouped = decode(name) as [String: [String]]? {
			return .init(
				grouped.flatMap { value, keys in keys.map { ($0, value) } },
				uniquingKeysWith: { first, _ in first }
			)
		}

		return decode(name) ?? [:]
	}

	static func string(from name: String) -> String {
		decode(name) ?? ""
	}

	static func list(from name: String) -> [String] {
		decode(name) ?? []
	}

	static func pairs(from name: String) -> [(String, String)] {
		(decode(name) as [[String]]?)?.map { ($0[0], $0[1]) } ?? []
	}

	static func tuples(from name: String) -> [String: (String, String)] {
		(decode(name) as [String: [String]]?)?.mapValues { ($0[0], $0[1]) } ?? [:]
	}

	static func optionalTuples(from name: String) -> [String: (String, String?)] {
		(decode(name) as [String: [String?]]?)?.mapValues { ($0[0] ?? "", $0.count > 1 ? $0[1] : nil) } ?? [:]
	}

	static func triples(from name: String) -> [String: (String, String, String)] {
		(decode(name) as [String: [String]]?)?.mapValues { ($0[0], $0[1], $0[2]) } ?? [:]
	}

	static func rows(from name: String) -> [[String]] {
		decode(name) ?? []
	}

	static func entries<T: Decodable>(from name: String) -> [T] {
		decode(name) ?? []
	}
}

// MARK: -
extension Resource {
	struct YearOverride {
		let original: String
		let years: Years
		let override: String
	}

	struct CityOverride: Decodable {
		let original: String
		let city: String
		let year: Int
		let override: String
	}

	struct ShowNameOverride: Decodable {
		let original: String?
		let showID: Int?
		let city: String?
		let year: Int?
		let override: String
	}

	struct CircuitRule {
		let original: String?
		let showID: Int?
		let show: String?
		let city: String?
		let state: String?
		let country: String?
		let years: Years?
		let circuit: String
	}

	struct DivisionOverride {
		let original: String
		let circuit: String?
		let city: String?
		let years: Years?
		let override: String
	}

	struct DivisionShowRule: Decodable {
		let show: String
		let division: String
		let replacesLabel: Bool?
	}

	struct DivisionEraRule {
		let circuit: String?
		let name: String?
		let prefix: String?
		let years: Years?
		let division: String?
	}

	struct CorpsOverride {
		let id: Int
		let circuit: String?
		let years: Years?
		let record: String
	}

	struct DateOverride: Decodable {
		let showID: Int
		let date: String
	}

	struct LocationOverride: Decodable {
		let showID: Int
		let location: String
	}

	struct EventMerge: Decodable {
		let showID: Int
		let into: Int
	}

	enum Years {
		case year(Int)
		case list([Int])
		case range(from: Int?, through: Int?)
	}
}

// MARK: -
extension Resource.YearOverride: Decodable {
	private enum CodingKeys: String, CodingKey {
		case original
		case year
		case years
		case override
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		original = try container.decode(String.self, forKey: .original)
		override = try container.decode(String.self, forKey: .override)
		years = try container.decodeIfPresent(Int.self, forKey: .year).map(Resource.Years.year) ?? container.decode(Resource.Years.self, forKey: .years)
	}
}

// MARK: -
extension Resource.CircuitRule: Decodable {
	private enum CodingKeys: String, CodingKey {
		case original
		case showID
		case show
		case city
		case state
		case country
		case year
		case years
		case circuit
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		original = try container.decodeIfPresent(String.self, forKey: .original)
		showID = try container.decodeIfPresent(Int.self, forKey: .showID)
		show = try container.decodeIfPresent(String.self, forKey: .show)
		city = try container.decodeIfPresent(String.self, forKey: .city)
		state = try container.decodeIfPresent(String.self, forKey: .state)
		country = try container.decodeIfPresent(String.self, forKey: .country)
		years = try container.decodeYears(.year, .years)
		circuit = try container.decode(String.self, forKey: .circuit)
	}
}

// MARK: -
extension Resource.DivisionOverride: Decodable {
	private enum CodingKeys: String, CodingKey {
		case original
		case circuit
		case city
		case year
		case years
		case override
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		original = try container.decode(String.self, forKey: .original)
		circuit = try container.decodeIfPresent(String.self, forKey: .circuit)
		city = try container.decodeIfPresent(String.self, forKey: .city)
		years = try container.decodeYears(.year, .years)
		override = try container.decode(String.self, forKey: .override)
	}
}

// MARK: -
extension Resource.DivisionEraRule: Decodable {
	private enum CodingKeys: String, CodingKey {
		case circuit
		case name
		case prefix
		case year
		case years
		case division
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		circuit = try container.decodeIfPresent(String.self, forKey: .circuit)
		name = try container.decodeIfPresent(String.self, forKey: .name)
		prefix = try container.decodeIfPresent(String.self, forKey: .prefix)
		years = try container.decodeYears(.year, .years)
		division = try container.decodeIfPresent(String.self, forKey: .division)
	}
}

// MARK: -
extension Resource.CorpsOverride: Decodable {
	private enum CodingKeys: String, CodingKey {
		case id
		case circuit
		case year
		case years
		case record
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		id = try container.decode(Int.self, forKey: .id)
		circuit = try container.decodeIfPresent(String.self, forKey: .circuit)
		years = try container.decodeYears(.year, .years)
		record = try container.decode(String.self, forKey: .record)
	}
}

// MARK: -
private extension KeyedDecodingContainer {
	func decodeYears(_ yearKey: Key, _ yearsKey: Key) throws -> Resource.Years? {
		try decodeIfPresent(Int.self, forKey: yearKey).map(Resource.Years.year) ?? decodeIfPresent(Resource.Years.self, forKey: yearsKey)
	}
}

// MARK: -
extension Resource.Years: Decodable {
	private enum CodingKeys: String, CodingKey {
		case list
		case from
		case through
	}

	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		if let list = try container.decodeIfPresent([Int].self, forKey: .list) {
			self = .list(list)
		} else {
			self = try .range(
				from: container.decodeIfPresent(Int.self, forKey: .from),
				through: container.decodeIfPresent(Int.self, forKey: .through)
			)
		}
	}
}

extension Resource.Years {
	func contains(_ year: Int) -> Bool {
		switch self {
		case let .year(value):
			return value == year
		case let .list(values):
			return values.contains(year)
		case let .range(from, through):
			return from.map { year >= $0 } ?? true && through.map { year <= $0 } ?? true
		}
	}
}

// MARK: -
private extension Resource {
	static func decode<T: Decodable>(_ name: String) -> T? {
		guard
			let url = Bundle.module.url(forResource: name, withExtension: "json"),
			let data = try? Data(contentsOf: url) else { return nil }

		return try? JSONDecoder().decode(T.self, from: data)
	}
}
