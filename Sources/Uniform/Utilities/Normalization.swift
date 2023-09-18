// Copyright © Fleuronic LLC. All rights reserved.

import Yams

import struct Foundation.Data
import class Foundation.Bundle

public struct Normalization {
	fileprivate let contents: [Node]
	fileprivate let insertions: Node.Mapping
	fileprivate let edits: Node.Mapping
	fileprivate let deletions: [Node]

	private init(resource: Resource) {
		let node = try! Yams.compose(
			yaml: .init(
				decoding: Data(
					contentsOf: Bundle.module.url(
						forResource: resource.rawValue,
						withExtension: "yaml"
					)!,
					options: []
				),
				as: UTF8.self
			)
		)!

		contents = node[.contents]?.array() ?? []
		insertions = node[.insertions]?.mapping ?? .init([])
		edits = node[.edits]?.mapping ?? .init([])
		deletions = node[.deletions]?.array() ?? []
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
		case shows
		case venues
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
private extension Node {
	subscript(key: Normalization.CodingKeys) -> Self? {
		self[key.rawValue]
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

	func deleted(from resource: Normalization.Resource) -> Self? {
		Normalization.resource(resource).deletions.compactMap(\.string).contains(where: contains) ? self : nil
	}


	static func inserted(for key: String, from resource: Normalization.Resource) -> Self? {
		key.value(
			resource: resource,
			keyPath: \.insertions
		)
	}
}

// MARK: -
private extension String {
	func value(
		resource: Normalization.Resource,
		keyPath: KeyPath<Normalization, Node.Mapping>
	) -> Self? {
		for (key, value) in Normalization.resource(resource)[keyPath: keyPath] {
			switch key {
			case let .scalar(scalar) where scalar.string == self:
				return value.string
			case let .sequence(sequence) where sequence.compactMap(\.string).contains(self):
				return value.string
			default:
				continue
			}
		}
		return nil
	}
}

// MARK: -
public extension [String] {
	init(resource: Normalization.Resource) {
		self = Normalization.resource(resource).contents.compactMap(\.string)
	}
}

private var cache: [Normalization.Resource: Normalization] = [:]
