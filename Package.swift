// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "JWT",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .watchOS(.v9),
        .tvOS(.v16),
    ],
    products: [
        .library(name: "JWT", targets: ["JWT"]),
    ],
    dependencies: [
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", exact: "1.0.0"),
    ],
    targets: [
        .target(
            name: "JWA",
            dependencies: ["CryptoSwift"],
            exclude: ["HMAC/HMACCommonCrypto.swift"]
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
    ],
    swiftLanguageVersions: [.v5]
)
