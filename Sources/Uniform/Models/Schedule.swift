// Copyright © Fleuronic LLC. All rights reserved.

import InitMacro

import struct Diesel.Corps
import struct Diesel.Feature

@Init public struct Schedule {
	public let feature: Feature?
	public let corps: Corps?
	public let displayCity: String?
	public let time: String?
}
