// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuthenticationApp",
    defaultLocalization: "pt_BR",
    platforms: [.iOS(.v16), .macOS(.v13), .tvOS(.v16), .watchOS(.v9)],
    products: [
        .library(
            name: "AuthenticationApp",
            targets: ["AuthenticationApp"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/brennobemoura/navigation-kit.git",
            from: "1.0.0-alpha.5"
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
            url: "https://github.com/request-dl/request-dl.git",
            from: "2.2.3"
        ),
        .package(
            url: "https://github.com/auth0/SimpleKeychain.git",
            from: "1.0.1"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubUI.git",
            from: "1.0.0"
        ),
        .package(
            url: "https://github.com/github-brenno-compass/GithubKit.git",
            from: "1.0.0"
        )
    ],
    targets: [
        // MARK: - App

        .target(
            name: "AuthenticationApp",
            dependencies: [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory",
                "GithubKit",
                "AuthenticationDomain",
                "AuthenticationAppData",
                "AuthenticationNetworking",
                "AuthenticationStorage",
                "AuthenticationScenes",
                "AuthenticationAlertsFeature",
                "AuthenticationLoginFeature"
            ],
            resources: [.process("Resources")]
        ),

        // MARK: - Core

        .target(
            name: "AuthenticationDomain",
            dependencies: [
                "Factory",
                "GithubKit"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "AuthenticationAppData",
            dependencies: [
                "Factory",
                "GithubKit",
                "AuthenticationDomain"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "AuthenticationNetworking",
            dependencies: [
                "Factory",
                "GithubKit",
                "AuthenticationDomain",
                "AuthenticationAppData",
                .product(name: "RequestDL", package: "request-dl")
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "AuthenticationStorage",
            dependencies: [
                "Factory",
                "GithubKit",
                "AuthenticationDomain",
                "AuthenticationAppData",
                "SimpleKeychain"
            ],
            resources: [.process("Resources")]
        ),

        .target(
            name: "AuthenticationScenes",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "AuthenticationDomain"
            ],
            resources: [.process("Resources")]
        ),

        // MARK: - Features

        .target(
            name: "AuthenticationAlertsFeature",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "AuthenticationDomain",
                "AuthenticationScenes"
            ],
            path: "Sources/Features/AuthenticationAlertsFeature",
            resources: [.process("Resources")]
        ),

        .target(
            name: "AuthenticationLoginFeature",
            dependencies: [
                "Factory",
                "GithubKit",
                "GithubUI",
                "AuthenticationDomain",
                "AuthenticationScenes"
            ],
            path: "Sources/Features/AuthenticationLoginFeature",
            resources: [.process("Resources")]
        ),

        // MARK: - App Tests

        .testTarget(
            name: "AuthenticationAppTests",
            dependencies: [
                "AuthenticationApp",
                "AuthenticationDomain",
                "AuthenticationAppData",
                "AuthenticationStorage",
                "AuthenticationNetworking",
                "AuthenticationScenes",
                "AuthenticationAlertsFeature",
                "AuthenticationLoginFeature",
                "Factory"
            ]
        )
    ]
)
