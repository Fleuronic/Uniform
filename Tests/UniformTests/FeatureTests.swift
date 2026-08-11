// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Feature

@testable import Uniform

struct FeatureTests {
	@Test(arguments: [
		("SoundSport", "SoundSport Exhibition"),
		("LIVE - Movie Theater Cinecast", "Big, Loud & Live")
	] as [(String, String)])
	func mapsSpecialNamedFeatures(_ pair: (input: String, expected: String)) {
		#expect(Feature.name(for: pair.input) == pair.expected)
	}

	@Test func leavesCanonicalSpecialNamesUnchanged() {
		#expect(Feature.name(for: "SoundSport Exhibition") == "SoundSport Exhibition")
	}

	@Test func returnsNilForNonFeatureRecords() {
		#expect(Feature.name(for: "Santa Clara Vanguard") == nil)
	}

	@Test(arguments: [
		("Presentation - Hall of Fame", "Presentation: Hall of Fame"),
		("Videoboard Feature - Encore", "Videoboard Feature: Encore")
	] as [(String, String)])
	func rewritesPresentationFeatures(_ pair: (input: String, expected: String)) {
		#expect(Feature.name(for: pair.input) == pair.expected)
	}

	@Test(arguments: [
		("Drumline Battle (Lot 5)", "DrumLine Battle"),
		("Championships", "Championship"),
		("Givaway", "Giveaway")
	] as [(String, String)])
	func normalizesAndTrimsKeywordFeatures(_ pair: (input: String, expected: String)) {
		#expect(Feature.name(for: pair.input) == pair.expected)
	}

	@Test func selectsTheKeywordBearingSegment() {
		#expect(Feature.name(for: "Sponsor Intro - Retreat") == "Retreat")
	}

	@Test func stripsThePresenterSuffix() {
		#expect(Feature.name(for: "Halftime Pres. Sponsor") == "Halftime")
	}

	@Test func appliesFeatureReplacementsBeforeSplitting() {
		#expect(Feature.name(for: "Encore: Finale") == "Encore")
	}
}
