// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Diesel",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
		.tvOS(.v13),
		.watchOS(.v6)
	],
    products: [
        .library(
            name: "Diesel",
            targets: [
				"Diesel"
			]
		)
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Diesel",
            dependencies: []
		)
    ]
)
