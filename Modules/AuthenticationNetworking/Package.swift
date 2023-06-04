// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticationNetworking",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "AuthenticationNetworking",
            targets: ["AuthenticationNetworking"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        ),
        .package(
            url: "https://github.com/request-dl/request-dl.git",
            from: "2.2.3"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        ),
        .package(path: "../AuthenticationDomain"),
        .package(path: "../AuthenticationAppData")
    ],
    targets: [
        .target(
            name: "AuthenticationNetworking",
            dependencies: [
                "Factory",
                .product(name: "RequestDL", package: "request-dl"),
                "GithubKit",
                "AuthenticationDomain",
                "AuthenticationAppData"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AuthenticationNetworkingTests",
            dependencies: ["AuthenticationNetworking"]
        )
    ]
)
