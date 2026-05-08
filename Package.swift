// swift-tools-version:5.9
import PackageDescription

#if canImport(CommonCrypto)
let dependencies: [Package.Dependency] = []
let excludes = ["HMAC/HMACCryptoSwift.swift"]
let targetDependencies: [Target.Dependency] = []
#else
let dependencies: [Package.Dependency] = [
    .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", from: "1.8.0"),
]
let excludes = ["HMAC/HMACCommonCrypto.swift"]
let targetDependencies: [Target.Dependency] = ["CryptoSwift"]
#endif

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
    dependencies: dependencies,
    targets: [
        .target(
            name: "JWA",
            dependencies: targetDependencies,
            exclude: excludes
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
