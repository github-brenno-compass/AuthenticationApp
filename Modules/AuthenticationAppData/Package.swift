// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticationAppData",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "AuthenticationAppData",
            targets: ["AuthenticationAppData"]
        )
    ],
    dependencies: [
       .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        ),
        .package(path: "../AuthenticationDomain")
    ],
    targets: [
        .target(
            name: "AuthenticationAppData",
            dependencies: [
                "Factory",
                "GithubKit",
                "AuthenticationDomain"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AuthenticationAppDataTests",
            dependencies: ["AuthenticationAppData"]
        )
    ]
)
