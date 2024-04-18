// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCMaps",
	platforms: [.iOS("12.0"), .tvOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCMaps",
			targets: ["GXUCMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "2.0.0-beta.7"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.0.0-beta.7")
	],
	targets: [
		.target(name: "GXUCMapsWrapper",
				dependencies: [
					"GXUCMaps",
					.product(name: "GXCoreModule_Common_Maps", package: "GXCoreModule_Common_Maps", condition: .when(platforms: [.iOS, .tvOS, .visionOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCMaps-2.0.0-beta.7.xcframework.zip",
			checksum: "11f186d945c6f4ed46c8dd0c171baa4293e767340d8c890c487b0959a8f5387c"
		)
	]
)