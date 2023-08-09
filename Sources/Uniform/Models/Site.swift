// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.URL
import struct Foundation.Data
import class Foundation.URLSession

public struct Site {
	private let domain: Domain
	private let path: Path
	private let contents: String

	public init?(
		domain: Domain,
		path: Path,
		slug: String
	) async {
		let url = URL(string: "\(domain.urlString)/\(domain.string(for: path)!)/\(slug)")!
		guard let (data, _) = try? await URLSession.shared.data(from: url) else { return nil }

		contents = .init(decoding: data, as: UTF8.self)

		self.domain = domain
		self.path = path
	}
}

public extension Site {
	enum Domain {
		case dci
	}

	enum Path {
		case events
		case scores
	}

	var data: Data? {
		contents.firstMatch(of: domain.dataRegex(for: path)!).flatMap {
			$0.output[1].substring
		}?.data(using: .utf8)
	}
}

private extension Site.Domain {
	var urlString: String {
		switch self {
		case .dci:
			return "https://dci.org"
		}
	}

	func string(for path: Site.Path) -> String? {
		switch (self, path) {
		case (.dci, .events):
			return "events"
		case (.dci, .scores):
			return "scores/final-scores"
		}
	}

	func dataRegex(for path: Site.Path) -> Regex<AnyRegexOutput>? {
		let string: String
		switch (self, path) {
		case (.dci, .events):
			string = "current\":(\\{\"id.*?),\"liveStreams"
		case (.dci, .scores):
			string = "current\":(\\[\\{\"categories.*?),\"listing"
		}

		return try! Regex(string)
	}
}
