// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PrettyFormatter",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
        .tvOS(.v12),
        .watchOS(.v4),
    ],
    products: [
        .library(
            name: "PrettyFormatter",
            targets: ["PrettyFormatter"]),
    ],
    targets: [
        .target(
            name: "PrettyFormatter"),
        .testTarget(
            name: "PrettyFormatterTests",
            dependencies: ["PrettyFormatter"]
        ),
    ]
)
