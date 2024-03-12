// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCMaps",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCMaps",
			targets: ["GXUCMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "1.5.0-beta.16"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-beta.16")
	],
	targets: [
		.target(name: "GXUCMapsWrapper",
				dependencies: [
					"GXUCMaps",
					.product(name: "GXCoreModule_Common_Maps", package: "GXCoreModule_Common_Maps", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCMaps",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCMaps-1.5.0-beta.16.xcframework.zip",
			checksum: "cfb0b8e39fe9f6a46a2457c26256acd3b1cca191905b3b43477bcb99e57a36e4"
		)
	]
)