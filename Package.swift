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
            targets: [
				"Uniform"
			]
		)
    ],
    dependencies: [
		.package(url: "https://github.com/Fleuronic/Diesel.git", branch: "main"),
		.package(url: "https://github.com/behrang/YamlSwift", from: "3.4.4")
	],
    targets: [
        .target(
            name: "Uniform",
            dependencies: [
				"Diesel",
				.product(name: "Yaml", package: "YamlSwift")
			],
			resources: [
				.copy("Resources/addresses.yaml"),
				.copy("Resources/corps.yaml"),
				.copy("Resources/features.yaml"),
				.copy("Resources/locations.yaml"),
				.copy("Resources/events.yaml"),
				.copy("Resources/venues.yaml")
			]
		)
    ]
)
