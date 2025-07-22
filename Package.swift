// swift-tools-version:5.6
import PackageDescription

let package = Package(
	name: "Uniform",
	platforms: [
		.iOS(.v15),
		.macOS(.v12),
		.tvOS(.v15),
		.watchOS(.v8)
	],
	products: [
		.library(
			name: "Uniform",
			targets: [
				"Uniform"
			]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "Uniform",
			dependencies: []
		)
	]
)
