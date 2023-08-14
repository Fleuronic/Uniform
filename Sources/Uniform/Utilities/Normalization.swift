// Copyright © Fleuronic LLC. All rights reserved.

import enum Yaml.Yaml
import struct Foundation.Data
import class Foundation.Bundle

public struct Normalization {
	fileprivate let contents: [String]
	fileprivate let insertions: [Yaml: String]
	fileprivate let edits: [Yaml: String]
	fileprivate let deletions: [String]

	private init(resource: Resource) {
		let yaml = try! Yaml.load(
			.init(
				decoding: Data(
					contentsOf: Bundle.module.url(
						forResource: resource.rawValue,
						withExtension: "yaml"
					)!,
					options: []
				),
				as: UTF8.self
			)
		)

		contents = yaml[.contents].array?.compactMap(\.string) ?? []
		insertions = yaml[.insertions].dictionary?.compactMapValues(\.string) ?? [:]
		edits = yaml[.edits].dictionary?.compactMapValues(\.string) ?? [:]
		deletions = yaml[.deletions].array?.compactMap(\.string) ?? []
	}

	static func resource(_ resource: Resource) -> Self {
		cache[resource] ?? {
			let normalization = Normalization(resource: resource)
			cache[resource] = normalization
			return normalization
		}()
	}
}

// MARK: -
public extension Normalization {
	enum Resource: String {
		case addresses
		case corps
		case features
		case locations
		case events
	}
}

// MARK: -
private extension Normalization {
	enum CodingKeys: String {
		case contents
		case insertions
		case edits
		case deletions
	}
}

// MARK: -
private extension Yaml {
	subscript(key: Normalization.CodingKeys) -> Self {
		self[Yaml.string(key.rawValue)]
	}
}

// MARK: -
public extension String {
	func normalized(from resource: Normalization.Resource) -> Self {
		value(
			resource: resource,
			keyPath: \.edits
		) ?? self
	}
	
	static func inserted(for key: String, from resource: Normalization.Resource) -> Self? {
		key.value(
			resource: resource,
			keyPath: \.insertions
		)
	}
	
	static func deleted(for key: String, from resource: Normalization.Resource) -> Self? {
		key.deletion(for: resource)
	}
}

// MARK: -
private extension String {
	func value(
		resource: Normalization.Resource,
		keyPath: KeyPath<Normalization, [Yaml: String]>
	) -> Self? {
		for (key, value) in Normalization.resource(resource)[keyPath: keyPath] {
			switch key {
			case let .string(string) where string == self:
				return value
			case let .array(array) where array.compactMap(\.string).contains(self):
				return value
			default:
				continue
			}
		}
		return nil
	}

	func deletion(for resource: Normalization.Resource) -> Self? {
		Normalization.resource(resource)[keyPath: \.deletions].first {
			starts(with: $0) && (contains("-") || contains(":"))
		}
	}
}

// MARK: -
public extension [String] {
	init(resource: Normalization.Resource) {
		self = Normalization.resource(resource).contents
	}
}

private var cache: [Normalization.Resource: Normalization] = [:]
