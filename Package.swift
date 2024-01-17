// swift-tools-version:5.8
import PackageDescription

let package = Package(
	name: "Uniform",
	platforms: [
		.iOS(.v13),
		.macOS(.v13),
		.tvOS(.v13),
		.watchOS(.v6)
	],
	products: [
		.library(
			name: "Uniform",
			targets: ["Uniform"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/Fleuronic/Diesel.git", branch: "main"),
		.package(url: "https://github.com/jpsim/Yams", from: "5.0.6")
	],
	targets: [
		.target(
			name: "Uniform",
			dependencies: [
				"Diesel",
				"Yams"
			],
			resources: [
				.copy("Resources/addresses.yaml"),
				.copy("Resources/corps.yaml"),
				.copy("Resources/features.yaml"),
				.copy("Resources/locations.yaml"),
				.copy("Resources/events.yaml"),
				.copy("Resources/shows.yaml"),
				.copy("Resources/venues.yaml")
			]
		)
	]
)
