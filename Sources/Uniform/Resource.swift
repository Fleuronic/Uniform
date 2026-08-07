// Copyright © Fleuronic LLC. All rights reserved.

import Foundation

enum Resource {
	static func map(_ name: String) -> [String: String] {
		decode(name) ?? [:]
	}

	static func list(_ name: String) -> [String] {
		decode(name) ?? []
	}

	static func pairs(_ name: String) -> [(String, String)] {
		(decode(name) as [[String]]?)?.map { ($0[0], $0[1]) } ?? []
	}

	static func tuples(_ name: String) -> [String: (String, String)] {
		(decode(name) as [String: [String]]?)?.mapValues { ($0[0], $0[1]) } ?? [:]
	}

	static func optionalTuples(_ name: String) -> [String: (String, String?)] {
		(decode(name) as [String: [String?]]?)?.mapValues { ($0[0] ?? "", $0.count > 1 ? $0[1] : nil) } ?? [:]
	}

	static func triples(_ name: String) -> [String: (String, String, String)] {
		(decode(name) as [String: [String]]?)?.mapValues { ($0[0], $0[1], $0[2]) } ?? [:]
	}

	static func rows(_ name: String) -> [[String]] {
		decode(name) ?? []
	}

	private static func decode<T: Decodable>(_ name: String) -> T? {
		guard
			let url = Bundle.module.url(forResource: name, withExtension: "json"),
			let data = try? Data(contentsOf: url)
		else { return nil }

		return try? JSONDecoder().decode(T.self, from: data)
	}
}
