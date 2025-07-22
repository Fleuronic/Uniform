// swift-tools-version:6.0
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
			targets: ["Uniform"]
		),
	],
	dependencies: [.package(url: "https://github.com/gohanlon/swift-memberwise-init-macro", from: "0.5.2"),],
	targets: [
		.target(
			name: "Uniform",
			dependencies: [.product(name: "MemberwiseInit", package: "swift-memberwise-init-macro")]
		)
	],
	swiftLanguageModes: [.v6]
)

for target in package.targets {
	target.swiftSettings = [
		.enableExperimentalFeature("StrictConcurrency"),
		.enableUpcomingFeature("ExistentialAny")
	]
}
