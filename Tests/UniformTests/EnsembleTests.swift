// Copyright © Fleuronic LLC. All rights reserved.

import Testing
import struct DrumKit.Ensemble

@testable import Uniform

struct EnsembleTests {
	@Test func resolvesLocationFromTheLocationsTable() {
		let info = Ensemble.info(for: "Joyfull - Winston-Salem, NC")
		#expect(info?.0 == "Joyfull")
		#expect(info?.1 == "Winston-Salem, NC")
	}

	@Test func canonicalizesTheNameBeforeLookup() {
		let info = Ensemble.info(for: "Apogee - Latrobe, PA")
		#expect(info?.0 == "APOGEE")
		#expect(info?.1 == "Latrobe, PA")
	}

	@Test func keepsBandsWhoseLocationIsInABandCountry() {
		let info = Ensemble.info(for: "Ravens - Athlone, Ireland")
		#expect(info?.0 == "Ravens")
		#expect(info?.1 == "Athlone, Ireland")
	}

	@Test func appliesInfoOverrides() {
		let info = Ensemble.info(for: "Lighthouse Brigade of Racine - Racine, WI")
		#expect(info?.0 == "Lighthouse Brigade")
		#expect(info?.1 == "Racine, WI")
	}

	@Test func usesTheRecordLocationForOwnLocationEnsembles() {
		let info = Ensemble.info(for: "Harpe Davids - Zoetermeer, Netherlands")
		#expect(info?.0 == "Harpe Davids")
		#expect(info?.1 == "Zoetermeer, Netherlands")
	}

	@Test func dropsTheLocationForNilLocationEnsembles() {
		let info = Ensemble.info(for: "Bands of America & Carolina Crown - Fort Mill, SC")
		#expect(info?.0 == "Bands of America & Carolina Crown")
		#expect(info?.1 == nil)
	}

	@Test func excludesRecordsMatchingAnExcludeKeyword() {
		#expect(Ensemble.info(for: "Marching Brass Group - Town, ST") == nil)
	}

	@Test func keepsKeywordEnsemblesWithTheirRecordLocation() {
		let info = Ensemble.info(for: "Sound Wave - Seattle, WA")
		#expect(info?.0 == "Sound Wave")
		#expect(info?.1 == "Seattle, WA")
	}

	@Test func returnsNilForUnrecognizedEnsembles() {
		#expect(Ensemble.info(for: "Random Corps - City, ST") == nil)
	}
}
