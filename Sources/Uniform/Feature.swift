// Copyright © Fleuronic LLC. All rights reserved.

import struct DrumKit.Feature

public extension Feature {
	static func name(for record: String) -> String? {
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

		let record = record
			.replacingOccurrences(of: "  ", with: " ")
			.replacingOccurrences(of: "Age Out", with: "Age-Out")
			.replacingOccurrences(of: "Drumline Battle", with: "DrumLine Battle")
			.replacingOccurrences(of: "Drum Line Battle", with: "DrumLine Battle")
			.replacingOccurrences(of: "Drumline Jam", with: "DrumLine Jam")
			.replacingOccurrences(of: "FJM Endzone -", with: "FJM Endzone Performance -")
			.replacingOccurrences(of: "Music Stage -", with: "Music Stage Performance -")
			.replacingOccurrences(of: "INPact", with: "INpact")
			.replacingOccurrences(of: "Givaway", with: "Giveaway")
			.replacingOccurrences(of: "On Field", with: "On-Field")
			.replacingOccurrences(of: "Gates open", with: "Gates Open")
			.replacingOccurrences(of: "Prelimis", with: "Prelims")
			.replacingOccurrences(of: "Championships", with: "Championship")

		let features = [
			"Announcement",
			"Anthem",
			"Award",
			"Begin",
			"Ceremony",
			"Championship",
			"Competition Resumes",
			"Doors Open",
			"Drum Jam",
			"DrumLine Battle",
			"DrumLine Jam",
			"Encore",
			"Endzone",
			"Event",
			"Exhibition Unit",
			"Gates Open",
			"Giveaway",
			"Halftime",
			"Hall of Fame",
			"Intermission",
			"Joint Performance",
			"Kick Start",
			"Music Stage",
			"Opening Remarks",
			"Place All-Age Corps",
			"Pre-",
			"Presentation",
			"Quintet",
			"Recognition",
			"Retreat",
			"Score",
			"Seating",
			"Showdown",
			"Special",
			"Stadium Closed to Spectators",
			"Standstill",
			"Ultimate Drill Book",
			"Video",
			"Welcome"
		]

		return if features.contains(where: record.contains) {
			record
				.replacingOccurrences(of: " and ", with: " & ")
				.replacingOccurrences(of: "Award ", with: "Awards")
				.replacingOccurrences(of: "AwardsCeremony", with: "Awards Ceremony")
				.replacingOccurrences(of: "Encore- ", with: "Encore - ")
				.replacingOccurrences(of: "Encore: ", with: "Encore - ")
				.replacingOccurrences(of: "Entertainment: ", with: "Entertainment - ")
				.replacingOccurrences(of: "Pre-show", with: "Pre-Show")
				.components(separatedBy: " - ")
				.first { features.contains(where: $0.contains) }!
				.components(separatedBy: " (").first!
				.components(separatedBy: " Pres. ").first!
		} else { nil }
	}
}
