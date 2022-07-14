// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "EKTabBarController",
    platforms: [.iOS(.v13)],
    products: [.library(name: "EKTabBarController", targets: ["EKTabBarController"])],
    dependencies: [.package(url: "https://github.com/SnapKit/SnapKit.git", from: "5.0.1")],
    targets:
        [
            .target(name: "EKTabBarController", dependencies: ["SnapKit"]),
            .testTarget(name: "EKTabBarControllerTests", dependencies: ["EKTabBarController"]),
        ]
)
