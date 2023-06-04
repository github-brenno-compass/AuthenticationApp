// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticationScenes",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "AuthenticationScenes",
            targets: ["AuthenticationScenes"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/brennobemoura/navigation-kit.git",
            from: "1.0.0-alpha.4"
        ),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture.git",
            from: "0.54.0"
        ),
        .package(
            url: "https://github.com/hmlongco/Factory.git",
            from: "2.1.5"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "AuthenticationApp",
            dependencies: [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory",
                "GithubKit"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AuthenticationScenesTests",
            dependencies: ["AuthenticationScenes"]
        ),
    ]
)
