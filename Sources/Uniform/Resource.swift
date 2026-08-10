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
