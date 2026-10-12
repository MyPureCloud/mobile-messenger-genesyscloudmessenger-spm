// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GenesysCloudMessenger",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "GenesysCloudMessenger",
            targets: ["GenesysCloudMessengerWrapper"]),
    ],
    dependencies: [
        .package(
            name: "GenesysCloudCore",
            url: "https://github.com/MyPureCloud/mobile-messenger-genesyscloudcore-spm.git",
            .exact("2.6.0")
        ),
        .package(
            name: "GenesysCloudMessengerTransport",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessengertransport-spm.git",
            .exact("2.16.0")
        ),
        .package(
            name: "GenesysCloudMobileUserTracking",
            url: "https://github.com/MyPureCloud/mobile-tracking-sdk-spm.git",
            .exact("1.0.0")
        )
    ],
    targets: [
        .binaryTarget(
            name: "GenesysCloudMessenger",
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v2.6.0/GenesysCloudMessenger.zip",
            checksum: "0e18a4f0cf2c181f4d3b5913c7b5390a05c87ec8a7ab8963a7e80a17032e566b"
        ),
        .target(
            name: "GenesysCloudMessengerWrapper",
            dependencies: [
                "GenesysCloudMessenger",
                .product(name: "GenesysCloudMessengerTransport", package: "GenesysCloudMessengerTransport"),
                .product(name: "GenesysCloudCore", package: "GenesysCloudCore"),
                .product(name: "GenesysCloudMobileUserTracking", package: "GenesysCloudMobileUserTracking")
            ]
        ),
        .testTarget(name: "PackageTests", dependencies: [
            "GenesysCloudMessenger"
        ])
    ]
)
