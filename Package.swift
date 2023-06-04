// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let cores = [
    "AuthenticationDomain",
    "AuthenticationAppData",
    "AuthenticationNetworking",
    "AuthenticationStorage",
    "AuthenticationScenes"
]

let features = [
    "AuthenticationAlertsFeature",
    "AuthenticationLoginFeature"
]

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
    dependencies: cores.map {
        .package(path: "Modules/\($0)")
    } + features.map {
        .package(path: "Modules/Features/\($0)")
    } + [
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
            dependencies: cores.map {
                .product(name: $0, package: $0)
            } + features.map {
                .product(name: $0, package: $0)
            } + [
                .product(name: "NavigationKit", package: "navigation-kit"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                "Factory",
                "GithubKit"
            ],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "AuthenticationAppTests",
            dependencies: ["AuthenticationApp"]
        )
    ]
)
