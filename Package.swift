// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCMaps",
	platforms: [.iOS("13.0"), .tvOS("13.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXUCMaps",
			targets: ["GXUCMapsWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreModule_Common_Maps.git", exact: "3.0.0-rc.8"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-rc.8")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCMaps-3.0.0-rc.8.xcframework.zip",
			checksum: "5b97b411a6c914f03a82437fcaea57cee022a218657945f25125d5d92f2e4c38"
		)
	]
)