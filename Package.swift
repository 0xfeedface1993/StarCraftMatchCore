// swift-tools-version:4.2
// Generated automatically by Perfect Assistant
// Date: 2019-04-09 07:01:33 +0000
import PackageDescription

/// Represents the version of the Swift language that should be used for
/// compiling Swift sources in the package.
public enum SwiftVersion {
    case v3
    case v4
    case v4_2
    case v5
    
    /// User-defined value of Swift version.
    ///
    /// The value is passed as-is to Swift compiler's `-swift-version` flag.
    case version(String)
}

let package = Package(
	name: "StarCraftMatchCore",
	products: [
		.library(name: "StarCraftMatchCore", targets: ["StarCraftMatchCore"])
	],
	dependencies: [
        .package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", "3.0.0"..<"4.0.0"),
        .package(url: "https://github.com/SwiftORM/SQLite-StORM.git", "3.0.0"..<"4.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Notifications.git", "4.0.0"..<"5.0.0"),
        .package(url: "https://github.com/PerfectlySoft/Perfect-Logger.git", "3.0.0"..<"4.0.0")
	],
	targets: [
		.target(name: "StarCraftMatchCore", dependencies: ["PerfectHTTPServer", "PerfectNotifications", "SQLiteStORM", "PerfectLogger"]),
		.testTarget(name: "StarCraftMatchCoreTests", dependencies: ["StarCraftMatchCore"])
	],
    swiftLanguageVersions: [.v5]
)
