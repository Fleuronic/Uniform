// Copyright © Fleuronic LLC. All rights reserved.

import InitMacro

@Init public struct Event {
	public let name: String
	public let slug: String
	public let startDate: String
	public let startTime: String?
	public let timeZone: String?
	public let venueAddress: String?
	public let venueZIP: String?
	public let venueCity: String
	public let venueState: String
	public let venueName: String?
	public let venueHost: String?
	public let schedules: [Schedule]?
}
