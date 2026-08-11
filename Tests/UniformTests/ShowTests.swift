// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Show

@testable import Uniform

struct ShowTests {
	@Test(arguments: ["DCE Contest", "DCG Contest", "IMBA Contest"])
	func dropsCircuitContestPlaceholders(_ record: String) {
		#expect(Show.name(for: record, in: nil, year: 2019).isEmpty)
	}

	@Test(arguments: ["Education", "Virtual Performance", "Rain Delay Show"])
	func flagsBlocklistedRecordsInvalid(_ name: String) {
		#expect(!Show.isValid(with: name))
	}

	@Test func treatsMissingOrOrdinaryNamesAsValid() {
		#expect(Show.isValid(with: nil))
		#expect(Show.isValid(with: "DCI Eastern Classic"))
	}

	@Test func doesNotProduceSlugsForInvalidShows() {
		#expect(Show.slug(forShowNamed: "Education Day", in: 2019) == nil)
	}

	@Test(arguments: ["Test Classic 2019", "2019 Test Classic", "42nd Annual Test Classic"])
	func stripsYearsAndAnnualPrefixes(_ record: String) {
		#expect(Show.name(for: record, in: nil, year: 2019) == "Test Classic")
	}

	@Test(arguments: [
		"Test Classic @ Some Stadium",
		"Test Classic presented by Sponsor",
		"Sponsor Presents: Test Classic"
	])
	func stripsVenueSponsorAndPresenterClauses(_ record: String) {
		#expect(Show.name(for: record, in: nil, year: 2019) == "Test Classic")
	}

	@Test func canonicalizesKnownShowNames() {
		#expect(Show.name(for: "Nightbeat", in: nil, year: 2019) == "NightBEAT")
	}

	@Test func appliesCityAndYearNameOverrides() {
		#expect(Show.name(for: "DCA Championships", in: "Syracuse", year: 2000) == "DCA World Championship Finals")
		#expect(Show.name(for: "DCI Denton", in: nil, year: 2017) == "DCI North Texas")
	}

	@Test func matchesOpenEndedYearSpecsInOverrides() {
		#expect(Show.name(for: "Tour of Champions – Chester", in: nil, year: 2017) == "Tour of Champions – PPL Park")
	}

	@Test func canonicalizesBySubstringMatch() {
		#expect(Show.name(for: "Soaring Sounds Spectacular", in: nil, year: 2019) == "Soaring Sounds")
	}

	@Test func collapsesFinalsSeparators() {
		#expect(Show.name(for: "Test Championships – Finals", in: nil, year: 2019) == "Test Championship Finals")
	}

	@Test func lowercasesConnectingWords() {
		#expect(Show.name(for: "Music In Motion", in: nil, year: 2019) == "Music in Motion")
	}

	@Test(arguments: [
		("DCI Eastern Classic", "dci-eastern-classic"),
		("Drums Along the Rockies!", "drums-along-the-rockies")
	] as [(String, String)])
	func generatesSlugFromValidName(_ pair: (name: String, slug: String)) {
		#expect(Show.slug(forShowNamed: pair.name, in: 2019) == pair.slug)
	}

	@Test func appliesScoreSlugYearOverridesAcrossRanges() {
		#expect(Show.scoreSlug(for: "dci-eastern-classic", in: nil, year: 2015) == "dci-eastern-classic-2")
	}

	@Test func appliesScoreSlugYearOverridesAcrossCommaLists() {
		#expect(Show.scoreSlug(for: "dci-open-class-world-championship-finals", in: nil, year: 2014) == "dci-world-championships-open-class-championship-finals")
	}

	@Test func appliesCitySpecificScoreSlugOverrides() {
		#expect(Show.scoreSlug(for: "show-of-shows", in: "Rockford", year: 2014) == "show-of-shows-2")
	}

	@Test func leavesUnknownScoreSlugsUnchanged() {
		#expect(Show.scoreSlug(for: "some-random-slug", in: nil, year: 2020) == "some-random-slug")
	}
}
