// swift-tools-version:5.7

import PackageDescription


let dependencies = [
  Package.Dependency.package(url: "https://github.com/kylef-archive/CommonCrypto.git", from: "1.0.0"),
]

let package = Package(
  name: "JWT",
  products: [
    .library(name: "JWT", targets: ["JWT"]),
  ],
  dependencies: dependencies,
  targets: [
    .target(name: "JWA", dependencies: targetDependencies, exclude: excludes),
    .target(name: "JWT", dependencies: ["JWA"]),
    .testTarget(name: "JWATests", dependencies: ["JWA"]),
    .testTarget(name: "JWTTests", dependencies: ["JWT"]),
  ]
)
