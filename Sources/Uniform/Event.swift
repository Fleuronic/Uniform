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
	public let venues: Venue
	public let schedules: [Schedule]?
}
