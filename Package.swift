// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "JWT",
    platforms: [
        .macOS(.v10_13), .iOS(.v12), .tvOS(.v12), .watchOS(.v4)
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"]),
    ],
    dependencies: [
        // We only fetch CryptoSwift for non-Apple platforms
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.0")
    ],
    targets: [
        .target(
            name: "JWA",
            dependencies: [
                .product(name: "CryptoSwift", package: "CryptoSwift", condition: .when(platforms: [.linux, .android, .windows]))
            ],
            exclude: [
                // Use block logic to exclude the wrong implementation based on platform
                // Note: Modern SPM prefers using internal #if in code, but these excludes work:
            ]
        ),
        .target(
            name: "JWT",
            dependencies: ["JWA"]
        ),
        .testTarget(
            name: "JWATests",
            dependencies: ["JWA"]
        ),
        .testTarget(
            name: "JWTTests",
            dependencies: ["JWT"]
        ),
    ]
)
