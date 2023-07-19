// swift-tools-version:5.6
import PackageDescription

let package = Package(
    name: "Uniform",
	platforms: [
		.iOS(.v13),
		.macOS(.v10_15),
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
    dependencies: [],
    targets: [
        .target(
            name: "Uniform",
            dependencies: []
		)
    ]
)
