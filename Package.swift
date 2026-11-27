// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCMaps",
	platforms: [.iOS("15.0"), .tvOS("18.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXUCMaps",
			targets: ["GXUCMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "5.1.0-beta.22"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "5.1.0-beta.22")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCMaps-5.1.0-beta.22.xcframework.zip",
			checksum: "098f59904a30395967f77f09f977f0d6c9be4238901ca53c6fcebd085041c492"
		)
	]
)