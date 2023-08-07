// Copyright © Fleuronic LLC. All rights reserved.

import struct Foundation.Date
import struct Foundation.TimeInterval
import struct Foundation.Calendar

public extension Date {
	init(
		date: Date,
		startTime: TimeInterval
	) {
		self = Calendar.current.date(
			byAdding: .hour,
			value: 19,
			to: Calendar.current.date(
				byAdding: .year,
				value: 1,
				to: date.addingTimeInterval(startTime)
			)!
		)!
	}
}
