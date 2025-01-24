// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "PrettyFormatter",
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
