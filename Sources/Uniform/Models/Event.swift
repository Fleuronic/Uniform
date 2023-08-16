// Copyright © Fleuronic LLC. All rights reserved.

public struct Event: Decodable {
	public let name: String
	public let slug: String
	public let startDate: String
	public let timeZone: String
	public let venueAddress: String
	public let venueZIP: String?
	public let venueCity: String
	public let venueState: String
	public let venueName: String
	public let schedules: [Schedule]?

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let venueContainer = try? container.nestedContainer(keyedBy: VenueKeys.self, forKey: .venue)
		let venue = try container.decodeIfPresent(Venue.self, forKey: .venues)

		name = try container.decode(String.self, forKey: .name).normalized(from: .events)
		slug = try container.decode(String.self, forKey: .slug)
		startDate = try container.decode(String.self, forKey: .startDate)
		timeZone = try container.decode(String.self, forKey: .timeZone)
		venueAddress = try container.decodeIfPresent(String.self, forKey: .venueAddress) ?? venueContainer!.decode(String.self, forKey: .address)
		venueZIP = try container.decodeIfPresent(String.self, forKey: .venueZIP) ?? venueContainer?.decode(String.self, forKey: .zipCode)
		venueCity = try container.decodeIfPresent(String.self, forKey: .venueCity) ?? container.decode(String.self, forKey: .locationCity).normalized(from: .locations)
		venueState = try container.decodeIfPresent(String.self, forKey: .venueState) ?? container.decode(String.self, forKey: .locationState)
		venueName = try venue.map(\.name) ?? venueContainer!.decode(String.self, forKey: .name)
		schedules = try container.decodeIfPresent([Schedule].self, forKey: .schedules)
	}
}

private extension Event {
	enum CodingKeys: CodingKey {
		case name
		case slug
		case startDate
		case timeZone
		case venueAddress
		case venueZIP
		case venueCity
		case venueState
		case venue
		case venues
		case locationCity
		case locationState
		case schedules
	}

	enum VenueKeys: String, CodingKey {
		case name
		case address
		case zipCode = "zioPostcode"
	}

	enum VenuesKeys: String, CodingKey {
		case name
	}
}
