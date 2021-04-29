// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Validation",
    products: [
        .library(
            name: "Validation",
            targets: ["Validation"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Validation",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "ValidationTests",
            dependencies: ["Validation"]
        )
    ]
)
