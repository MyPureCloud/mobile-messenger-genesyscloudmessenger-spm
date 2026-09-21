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
            .exact("2.5.0")
        ),
        .package(
            name: "GenesysCloudMessengerTransport",
            url: "https://github.com/MyPureCloud/mm-genesyscloudmessengertransport-spm.git",
            .exact("2.15.0")
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
            url: "https://github.com/MyPureCloud/mobile-messenger-ios-sdk/releases/download/v2.5.0/GenesysCloudMessenger.zip",
            checksum: "cc21a99f7ad0650c5baf9a6ec640bdba588138b1048b6ebf8974849b557b470c"
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
