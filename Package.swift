// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "API-Football",
    platforms: [.iOS(.v15), .macOS(.v14)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "API-Football",
            targets: ["API-Football"]),
    ],
    dependencies: [
        .package(url: "https://github.com/shawon1fb/EasyXConnect.git", from: "2.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "API-Football",
            dependencies: [
                .product(name: "EasyXConnect", package: "EasyXConnect"),
            ]
        ),
        .testTarget(
            name: "API-FootballTests",
            dependencies: ["API-Football"]
        ),
    ]
)
