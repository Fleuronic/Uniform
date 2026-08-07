// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Feature

@testable import Uniform

struct FeatureTests {
	@Test func matchesLegacy() {
		let inputs = [
			"SoundSport", "SoundSport Exhibition", "LIVE - Movie Theater Cinecast", "Loge and Terrace Levels Open",
			"Presentation - Retiring of Colors", "Something - Special", "Videoboard Feature Reel",
			"Trophy Presentation - Univ. of Whatever",
			"Gates open", "Age Out Ceremony", "Drumline Battle", "Drum Line Battle", "Drumline Jam",
			"FJM Endzone - Blue Devils", "Music Stage - Crown", "INPact", "Givaway", "On Field Warmup",
			"Prelimis", "Championships",
			"Intermission", "Welcome & National Anthem", "Scores Announced", "Retreat",
			"Hall of Fame Ceremony", "Ultimate Drill Book", "Standstill",
			"Award and Ceremony", "AwardsCeremony", "Encore- Crown", "Encore: Crown",
			"Entertainment: The Cadets", "Pre-show", "Place All-Age Corps",
			"Anthem The Star-Spangled Banner",
			"Blue Devils - Concord, CA", "Carolina Crown", "Random Corps Name",
			"Awards Ceremony (Open Class) Pres. Someone",
			"Encore - Blue Devils - Concord, CA"
		]

		for input in inputs {
			#expect(Feature.name(for: input) == Self.legacyName(for: input), "mismatch for \(input)")
		}
	}

	private static func legacyName(for record: String) -> String? {
		switch record {
		case "SoundSport", "SoundSport Exhibition": return "SoundSport Exhibition"
		case "LIVE - Movie Theater Cinecast": return "Big, Loud & Live"
		case "Loge and Terrace Levels Open": return record
		default: break
		}

		if ["Presentation -", " - Special", "Videoboard Feature"].contains(where: record.contains) {
			return record
				.replacingOccurrences(of: " -", with: ":")
				.replacingOccurrences(of: "Univ.", with: "University")
		}

		let recordReplacements = [
			("  ", " "),
			("\"", ""),
			("'", "’"),
			("Age Out", "Age-Out"),
			("Drumline Battle", "DrumLine Battle"),
			("Drum Line Battle", "DrumLine Battle"),
			("Drumline Jam", "DrumLine Jam"),
			("FJM Endzone -", "FJM Endzone Performance -"),
			("Music Stage -", "Music Stage Performance -"),
			("INPact", "INpact"),
			("Givaway", "Giveaway"),
			("On Field", "On-Field"),
			("Gates open", "Gates Open"),
			("Prelimis", "Prelims"),
			("Championships", "Championship")
		]
		let record = recordReplacements.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }

		let features = [
			"Announcement", "Anthem", "Award", "Begin", "Ceremony", "Championship",
			"Competition Resumes", "Doors Open", "Drum Jam", "DrumLine Battle", "DrumLine Jam",
			"Encore", "Endzone", "Event", "Exhibition Unit", "Gates Open", "Giveaway",
			"Halftime", "Hall of Fame", "Intermission", "Joint Performance", "Kick Start",
			"Music Stage", "Opening Remarks", "Place All-Age Corps", "Pre-", "Presentation",
			"Quintet", "Recognition", "Retreat", "Score", "Seating", "Showdown", "Special",
			"Stadium Closed to Spectators", "Standstill", "Ultimate Drill Book", "Video", "Welcome"
		]

		guard features.contains(where: record.contains) else { return nil }

		let featureReplacements = [
			(" and ", " & "),
			("Award ", "Awards"),
			("AwardsCeremony", "Awards Ceremony"),
			("Encore- ", "Encore - "),
			("Encore: ", "Encore - "),
			("Entertainment: ", "Entertainment - "),
			("Pre-show", "Pre-Show")
		]

		return featureReplacements
			.reduce(record) { $0.replacingOccurrences(of: $1.0, with: $1.1) }
			.components(separatedBy: " - ")
			.first { features.contains(where: $0.contains) }!
			.components(separatedBy: " (").first!
			.components(separatedBy: " Pres. ").first!
	}
}
